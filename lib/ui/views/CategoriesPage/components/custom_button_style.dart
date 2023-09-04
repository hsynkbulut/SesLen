import 'package:flutter/material.dart';
import 'package:seslen_app/core/utils/themes/custom_colors.dart';

class CustomButtonStyle {
  static ButtonStyle getStyle() {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(10.0),
      fixedSize: const Size(200, 52),
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: primaryColor, //butonun arkaplan rengi
      foregroundColor: mainAuxiliaryColor, //butonun yazı ve ikon rengi
      elevation: 15, //gölgelik boyutu
      shadowColor: Colors.yellow, //gölgelik rengi
      side: const BorderSide(
        color: primaryColor,
        width: 2,
      ), //kenarlık rengi ve boyutu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ), //Butonun kenarlık ovalliğini ayarlamak için
    );
  }
}
