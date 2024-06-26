import 'package:flutter/material.dart';

import '../../components/custom_appbar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("Hakkımızda Sayfası Ekranı"),
            ElevatedButton(onPressed: () {}, child: const Text("Tıkla")),
          ],
        ),
      ),
    );
  }
}
