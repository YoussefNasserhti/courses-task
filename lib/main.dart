import 'package:flutter/material.dart';
import 'package:courses_task/Core/Theme/app_theme.dart';
import 'package:courses_task/UI/CourseDetails/course_details_page.dart';
import 'package:courses_task/UI/Home/home_page.dart';
import 'package:courses_task/UI/Splash/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeNight,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashPage.routeName: (_) => SplashPage(),
        HomePage.routeName: (_) => HomePage(),
        CourseDetailsPage.routeName: (_) => CourseDetailsPage(),
      },
      initialRoute: SplashPage.routeName,
    );
  }
}
