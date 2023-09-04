// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final _nameController = TextEditingController();
  final _feedbackController = TextEditingController();
  bool _isNameFilled = false;
  bool _isAnonymous = false;
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateNameStatus);
  }

  void _updateNameStatus() {
    setState(() {
      _isNameFilled = _nameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD900),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              Center(
                child: Text(
                  'Geri Bildirim Gönder',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Bize geri bildirimde bulunarak uygulamamızı daha iyi hale getirmemizde yardımcı olabilirsiniz.",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Adınız',
                  labelText: 'Adınız',
                  filled: true,
                  fillColor: Color(0xffFEFDFC),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _feedbackController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Geri bildiriminizi buraya yazın',
                  labelText: 'Geri Bildiriminiz',
                  filled: true,
                  fillColor: Color(0xffFEFDFC),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _isAnonymous,
                    onChanged: (newValue) {
                      setState(() {
                        _isAnonymous = newValue!;
                      });
                    },
                  ),
                  Text('Anonim Geri Bildirim'),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Derecelendirme: '),
                  for (int i = 1; i <= 5; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _rating = i;
                        });
                      },
                      child: Icon(
                        Icons.star,
                        color: _rating >= i ? Color(0xFF1B1B1B) : Colors.grey,
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: (_isNameFilled || _isAnonymous)
                        ? MaterialStateProperty.all<Color>(Color(0xFF1B1B1B))
                        : MaterialStateProperty.all<Color>(Colors.grey),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Köşeleri tamamen kare yapar
                      ),
                    ),
                  ),
                  onPressed: (_isNameFilled || _isAnonymous)
                      ? () {
                          // Geri bildirim gönderme işlemleri burada yapılır
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Color(0xFF1B1B1B),
                              title: Text(
                                'Geri Bildirim Gönderildi',
                                style: TextStyle(color: Color(0xffFEFDFC)),
                              ),
                              content: Text(
                                _isAnonymous
                                    ? 'Teşekkür ederiz! Anonim geri bildiriminiz ve $_rating yıldızlı derecelendirmeniz alındı.'
                                    : 'Teşekkür ederiz! Geri bildiriminiz ve $_rating yıldızlı derecelendirmeniz alındı.',
                                style: TextStyle(color: Color(0xffFEFDFC)),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xFFFFB300)),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Tamam',
                                    style: TextStyle(color: Color(0xFF1B1B1B)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      : null,
                  child: Text(
                    'Gönder',
                    style: TextStyle(color: Color(0xffFEFDFC)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
