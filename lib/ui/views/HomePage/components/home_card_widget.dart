import 'package:flutter/material.dart';
import 'package:seslen_app/common/constants/image_strings.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key});

  Widget cardbuilderTR(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: Image.asset(
          ImagePaths.turkeyIcon, // Bu resmin yolunu projenize göre ayarlayın
          fit: BoxFit.cover,
          height: 120.0,
          width: 130.0,
        ),
      ),
    );
  }

  Widget cardbuilderLAN(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: Image.asset(
          ImagePaths
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
        cardbuilderTR(context),
        //SizedBox(width: 25.0),
        cardbuilderLAN(context),
      ],
    );
  }
}
