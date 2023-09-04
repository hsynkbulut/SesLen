// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:seslen_app/core/utils/themes/background_gradient.dart';
import 'package:seslen_app/core/utils/themes/custom_colors.dart';
import 'package:seslen_app/ui/views/HomePage/components/home_card_widget.dart';
import 'package:seslen_app/ui/views/HomePage/components/home_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BackgroundGradient backgroundGradient = BackgroundGradient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientColor2, //Color(0xFFFFC800),
      /*
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Image.asset(
            PathConstant.appBarLogoImage,
            width: 10,
            height: 10,
            alignment: Alignment.center,
          ),
        ),
        centerTitle: true,
        title: Text("SesLen"),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: mainAuxiliaryColor),
      ),
      */
      body: Container(
        color: mainAuxiliaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                color: mainAuxiliaryColor,
              ),
              Container(
                padding: const EdgeInsets.only(top: 33.0),
                decoration: backgroundGradient.buildGradient2(),
                /*
                BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  color: primaryColor,
                ),
                */
                height: 200,
                child: HomeCardWidget(),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.only(top: 33.0),
                  decoration: backgroundGradient
                      .buildGradient(), // Arka plan rengini gradient olarak ayarlamak için
                  /*
                  BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    color: Color(0xFFFFD900),
                  ),
                  */
                  height: 500,
                  child: HomeGridView(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
