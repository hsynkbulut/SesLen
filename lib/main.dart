import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seslen_app/core/utils/routing/route_constant.dart';
import 'package:seslen_app/core/utils/routing/route_generator.dart';
import 'package:seslen_app/ui/components/custom_bottom_navbar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp(

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstant.homeScreenRoute,
      onGenerateRoute: RouterGenerator.generateRoute,
      title: 'SesLen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      /*
      ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      */
      home:
          const CustomBottomNavbar(), //Uygulama ilk açıldığında gösterilecek olan sayfa
    );
  }
}

/*theme: ThemeData.light() yapıp,  SystemUiOverlayStyle.light yaparsan saat, 
şarj vs. üst bilgi kaybolur.*/







