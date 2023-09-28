import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SesLen",
          style: TextStyle(
            //fontSize: 15.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Color(0xffFEFDFC),
          ),
        ),
        leading: Container(
          padding: EdgeInsets.all(5),
          child:  Image.asset('assets/icons/app_logo.png'),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1B1B1B),
      ),
    );
  }
}

