import 'package:flutter/material.dart';

enum HeightSize {
  size8,
  size10,
  size16
} // Belirli yükseklik seçeneklerini temsil eden enum

class HeightSizeWidget extends StatelessWidget {
  const HeightSizeWidget({
    super.key,
    required this.selectedSize,
  });

  final HeightSize selectedSize; // Seçilen yükseklik değeri

  @override
  Widget build(BuildContext context) {
    double height = 0.0;
    switch (selectedSize) {
      case HeightSize.size8:
        height = 8.0;
        break;
      case HeightSize.size10:
        height = 10.0;
        break;
      case HeightSize.size16:
        height = 16.0;
        break;
    }
    return SizedBox(height: height);
  }
}
