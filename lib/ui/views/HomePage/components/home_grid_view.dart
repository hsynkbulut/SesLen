import 'package:flutter/material.dart';
import 'package:seslen_app/common/constants/image_strings.dart';
import 'package:seslen_app/common/constants/string_constant.dart';
import 'package:seslen_app/core/utils/routing/route_constant.dart';
import 'package:seslen_app/core/utils/themes/custom_colors.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({super.key});

  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  List data = [
    {
      "name": StringConstant.textVideoName,
      "iconPath": ImagePaths.textVideoIcon
    },
    {
      "name": StringConstant.speechVideoName,
      "iconPath": ImagePaths.speechVideoIcon
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                //print("metinden videoya basıldı");
                Navigator.pushNamed(
                    context, RouteConstant.textToVideoScreenRoute);
              } else if (index == 1) {
                //print("sestenVideoya Basıldı");
                Navigator.pushNamed(
                    context, RouteConstant.speechToVideoScreenRoute);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [gradientDarkColor1, gradientDarkColor2],
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  elevation: 5.5,
                  color: transparentColor,
                  child: Column(
                    //mainAxisAlignment: dikeydeki konumlarını ayarlar.
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: yataydaki konumlarını ayarlar.
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        data[index]["iconPath"], // Resim yolunu al
                        height: 100, // İstediğiniz boyutu ayarlayın
                        width: 100, // İstediğiniz boyutu ayarlayın
                      ),
                      Text(
                        data[index]["name"],
                        style: const TextStyle(
                            color: mainAuxiliaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
