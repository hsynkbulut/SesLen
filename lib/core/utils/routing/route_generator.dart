// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:seslen_app/ui/components/custom_bottom_navbar.dart';
import 'package:seslen_app/ui/views/AboutPage/about_page.dart';
import 'package:seslen_app/ui/views/CategoriesPage/text_to_video.dart';
import 'package:seslen_app/ui/views/CategoriesPage/speech_to_video.dart';
import 'package:seslen_app/ui/views/HelpPage/help_page.dart';
import 'route_constant.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => CustomBottomNavbar());
      case RouteConstant.helpScreenRoute:
        return MaterialPageRoute(builder: (_) => HelpPage());
      case RouteConstant.aboutScreenRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case RouteConstant.textToVideoScreenRoute:
        return MaterialPageRoute(builder: (_) => TextToVideo());
      case RouteConstant.speechToVideoScreenRoute:
        return MaterialPageRoute(builder: (_) => SpeechToVideo());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}
