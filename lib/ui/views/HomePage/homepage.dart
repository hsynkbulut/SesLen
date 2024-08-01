// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:seslen_app/core/utils/themes/background_gradient.dart';
import 'package:seslen_app/core/utils/themes/custom_colors.dart';
import 'package:seslen_app/ui/views/HomePage/components/home_card_widget.dart';
import 'package:seslen_app/ui/views/HomePage/components/home_grid_view.dart';

import '../../components/custom_appbar.dart';

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
      appBar: CustomAppBar(),
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
                height: 200,
                child: HomeCardWidget(),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.only(top: 33.0),
                  decoration: backgroundGradient.buildGradient(),
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
