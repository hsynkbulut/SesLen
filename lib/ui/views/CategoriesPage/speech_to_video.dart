// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:seslen_app/common/constants/custom_edge_insets.dart';
import 'package:seslen_app/common/constants/height_size_widget.dart';
import 'package:seslen_app/common/helpers/snackbar_helper.dart';
import 'package:seslen_app/core/services/video_data_manager.dart';
import 'package:seslen_app/core/utils/themes/background_gradient.dart';
import 'package:seslen_app/core/utils/themes/custom_colors.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'components/custom_button_style.dart';
import 'components/custom_text_field.dart';

class SpeechToVideo extends StatefulWidget {
  const SpeechToVideo({super.key});

  @override
  _SpeechToVideoState createState() => _SpeechToVideoState();
}

class _SpeechToVideoState extends State<SpeechToVideo> {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  List<ChewieController> _chewieControllers = [];
  int _currentVideoIndex = 0;
  String _spokenText = "";
  final TextEditingController _textEditingController = TextEditingController();
  bool _isListening = false;

  BackgroundGradient backgroundGradient = BackgroundGradient();

  @override
  void dispose() {
    for (var controller in _chewieControllers) {
      controller.dispose();
    }
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _startListening() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize(
        onStatus: (status) {},
        onError: (error) {},
      );

      if (available) {
        setState(() {
          _isListening = true;
        });
        _speechToText.listen(
          onResult: (result) {
            setState(() {
              _isListening = false; // Kullanıcının konuşması bittiğinde durdur
              _spokenText = result.recognizedWords;
              _textEditingController.text = _spokenText;
            });
          },
          onSoundLevelChange: (level) {
            // Kullanıcı hala konuşuyorsa, AvatarGlow'ı çalıştır
            setState(() {
              _isListening = true;
            });
          },
        );
      }
    }
  }

  Future<void> _stopListening() async {
    if (_isListening) {
      _speechToText.stop();
      //_convertTextToVideos(_spokenText);
      setState(() {
        _isListening = false;
      });
    }
  }

  Future<void> _convertTextToVideos(String text) async {
    // Kullanıcıya bilgilendirme mesajını göstermek için
    SnackBarHelper.showSnackBar(
        context, "Konuşma çevriliyor, lütfen bekleyin...");

    List<String> words = text.toLowerCase().split(" ");
    List<ChewieController> newControllers = [];

    Map<String, List<String>>? videoUrls = await VideoDataManager.videoUrls;

    for (var word in words) {
      if (videoUrls!.containsKey(word)) {
        for (var url in videoUrls[word]!) {
          VideoPlayerController videoPlayerController =
              VideoPlayerController.networkUrl(Uri.parse(url));
          await videoPlayerController.initialize();
          ChewieController chewieController = ChewieController(
            videoPlayerController: videoPlayerController,
            autoPlay: false,
            looping: false,
            aspectRatio: 1.5, //Bu değeri istediğiniz gibi ayarlayabilirsiniz
          );
          newControllers.add(chewieController);
        }
      } else {
        VideoPlayerController videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(
                'https://isaretdilisozlugu.com/video/kelime/vid_bilmemek.mp4'));
        await videoPlayerController.initialize();
        ChewieController chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: false,
          looping: false,
          aspectRatio: 1.5, //Bu değeri istediğiniz gibi ayarlayabilirsiniz
        );
        newControllers.add(chewieController);
      }
    }

    setState(() {
      _chewieControllers = newControllers;
      _currentVideoIndex = 0;
    });

    // Videoları oynat
    await _playVideos();

    // İşlem bittiğinde metin alanını temizle
    _textEditingController.clear();
  }

  Future<void> _playVideos() async {
    if (_currentVideoIndex < _chewieControllers.length) {
      await _chewieControllers[_currentVideoIndex]
          .videoPlayerController
          .seekTo(Duration.zero);
      await _chewieControllers[_currentVideoIndex].videoPlayerController.play();

      await Future.delayed(_chewieControllers[_currentVideoIndex]
          .videoPlayerController
          .value
          .duration);

      await _chewieControllers[_currentVideoIndex]
          .videoPlayerController
          .pause();

      setState(() {
        _currentVideoIndex++;
      });

      _playVideos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: bgColor,
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Video Çeviri",
          ),
          backgroundColor: primaryColor //Color(0xFF3468EA),
          ),
      body: Container(
        decoration: backgroundGradient
            .buildGradient(), // Arka plan rengini gradient olarak ayarlamak için
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: CustomEdgeInsets.paddingAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: CustomEdgeInsets.paddingVertical,

                        // Metin alanının yüksekliği burada belirleniyor.
                        height: _textEditingController.text.isEmpty
                            ? 300.0 // Başlangıç yüksekliği, eskisi: 100.0
                            : null, // Metin girildiğinde yükseklik otomatik ayarlanacak
                        child: CustomTextField(
                          textEditingController: _textEditingController,
                          onChanged: (text) {
                            setState(
                                () {}); // Metin değiştiğinde yeniden çizim yapılmasını sağlar
                          },
                        ),
                      ),
                      const HeightSizeWidget(selectedSize: HeightSize.size10),
                      OutlinedButton(
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.translate),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Çevir")
                          ],
                        ),
                        onPressed: () {
                          String inputText = _textEditingController.text;
                          _convertTextToVideos(inputText);
                        },
                        style: CustomButtonStyle.getStyle(),
                      ),
                      const HeightSizeWidget(selectedSize: HeightSize.size8),
                      if (_chewieControllers.isNotEmpty &&
                          _currentVideoIndex < _chewieControllers.length)
                        Container(
                          alignment: Alignment.center,
                          padding: CustomEdgeInsets.paddingXY,
                          margin: CustomEdgeInsets.marginBottom,
                          height: MediaQuery.of(context).size.height *
                              0.3, // Yüksekliği ayarla. Eski değeri: 0.4
                          decoration: BoxDecoration(
                            color: primaryColor, //Video çerçeve rengi
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Chewie(
                            controller: _chewieControllers[_currentVideoIndex],
                          ),
                        ),
                      const HeightSizeWidget(selectedSize: HeightSize.size16),
                      AvatarGlow(
                        animate: _isListening,
                        glowColor: primaryColor,
                        endRadius: 50.0,
                        duration: const Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        child: SizedBox(
                          width: 65,
                          height: 65,
                          child: FittedBox(
                            child: FloatingActionButton(
                              onPressed: () {
                                if (_isListening) {
                                  _stopListening();
                                } else {
                                  _startListening();
                                }
                              },
                              backgroundColor:
                                  _isListening ? primaryColor : primaryColor,
                              child: Icon(
                                _isListening ? Icons.mic : Icons.mic_none,
                                color: _isListening
                                    ? secondaryColor //Mikrofon aktifken ikon rengi
                                    : mainAuxiliaryColor, //Mikrofon pasifken ikon rengi
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
