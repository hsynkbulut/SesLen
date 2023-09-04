// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable
import 'package:flutter/material.dart';
import 'package:seslen_app/common/constants/path_constant.dart';
import 'package:seslen_app/common/constants/string_constant.dart';
import 'package:seslen_app/core/utils/routing/route_constant.dart';
import 'package:seslen_app/core/utils/themes/custom_colors.dart';
//import 'destination_page_1.dart'; // İlk kart için yönlendirilecek sayfanın import yolu
//import 'destination_page_2.dart'; // İkinci kart için yönlendirilecek sayfanın import yolu

class HomeGridView extends StatelessWidget {
  List data = [
    {
      "name": StringConstant.textVideoName,
      "iconPath": PathConstant.textVideoIcon
    },
    {
      "name": StringConstant.speechVideoName,
      "iconPath": PathConstant.speechVideoIcon
    },
  ];

  HomeGridView({super.key});

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
                  gradient: LinearGradient(
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
                        style: TextStyle(
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
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}

/*NOT: AxisAlignment'ların özellikleri Row yada Column olmasına göre değişir.
Yani burada Column'a göre özellikleri böyle iken Row'da tam tersi oluyor. */