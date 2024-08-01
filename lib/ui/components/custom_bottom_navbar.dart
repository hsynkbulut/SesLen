// ignore_for_file: library_private_types_in_public_api
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seslen_app/core/utils/themes/custom_colors.dart';
import 'package:seslen_app/ui/views/AboutPage/about_page.dart';
import 'package:seslen_app/ui/views/HomePage/homepage.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  _CustomBottomNavbarState createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = const [HomePage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: mainAuxiliaryColor,
        unSelectedColor: intermediateAuxiliaryColor,
        backgroundColor: primaryColor,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 2,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Anasayfa',
            icon: FontAwesomeIcons.house,
          ),
          CustomBottomBarItems(
              label: 'Hakkımızda', icon: FontAwesomeIcons.circleInfo),
        ],
      ),
    );
  }
}
