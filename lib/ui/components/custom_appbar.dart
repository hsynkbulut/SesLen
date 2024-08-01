import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seslen_app/common/constants/app_constant.dart';
import 'package:seslen_app/common/constants/image_strings.dart';
import '../../core/utils/routing/route_constant.dart';
import '../../core/utils/themes/custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.showBackButton = false});

  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _navigateToHomePage(BuildContext context) {
    Navigator.pushNamed(context, RouteConstant.homeScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: mainAuxiliaryColor,
        title: GestureDetector(
          onTap: () {
            _navigateToHomePage(context);
          },
          child: const Text(
            AppConstant.appName,
            style: TextStyle(
              //fontSize: 15.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: mainAuxiliaryColor,
            ),
          ),
        ),
        leading: showBackButton
            ? IconButton(
                icon: const Icon(FontAwesomeIcons.angleLeft),
                onPressed: () => Navigator.of(context).pop(),
              )
            : Container(
                padding: const EdgeInsets.all(5),
                child: Image.asset(ImagePaths.appLogo),
              ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
    );
  }
}
