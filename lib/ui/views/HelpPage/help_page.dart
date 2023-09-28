import 'package:flutter/material.dart';
import 'package:seslen_app/ui/components/custom_appbar.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("Yardım lütfen"),
            ElevatedButton(onPressed: () {}, child: const Text("Tıkla")),
          ],
        ),
      ),
    );
  }
}
