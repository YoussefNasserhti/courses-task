import 'package:flutter/material.dart';
import 'package:courses_task/Core/Theme/app_theme.dart';
import 'package:courses_task/Core/Images/asset_image_paths.dart';

import '../Home/home_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
          (value) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.themeLight.scaffoldBackgroundColor,
      body: SizedBox.expand(
        child: Image.asset(
          AssetImagePaths.splashLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
