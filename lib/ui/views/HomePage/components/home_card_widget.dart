// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:seslen_app/common/constants/path_constant.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key});

  Widget cardbuilderTR() {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Image.asset(
          PathConstant.turkeyIcon, // Bu resmin yolunu projenize göre ayarlayın
          fit: BoxFit.cover,
          height: 120.0,
          width: 120.0,
        ),
      ),
    );
  }

  Widget cardbuilderLAN() {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Image.asset(
          PathConstant
              .signLanguageIcon, // Bu resmin yolunu projenize göre ayarlayın
          fit: BoxFit.cover,
          height: 120.0,
          width: 120.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: yataydaki konumlarını ayarlar.
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: dikeydeki konumlarını ayarlar.
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        cardbuilderTR(),
        //SizedBox(width: 25.0),
        cardbuilderLAN(),
      ],
    );
  }
}

/*NOT: AxisAlignment'ların özellikleri Row yada Column olmasına göre değişir.
Yani burada Row'a göre özellikleri böyle iken Column'da tam tersi oluyor. */