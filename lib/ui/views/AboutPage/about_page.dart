import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakkımızda'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Hakkımızda"),
            ElevatedButton(onPressed: () {}, child: const Text("Tıkla")),
          ],
        ),
      ),
    );
  }
}
