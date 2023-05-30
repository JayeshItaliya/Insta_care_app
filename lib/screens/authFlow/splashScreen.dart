import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/pageNavigator.dart';

import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image:DecorationImage(
                image: AssetImage(
                  AppAssets.splashPage,
                ),
                fit: BoxFit.cover
            )
        ),

      ),
    );
  }
  navigateToScreen() async {
    await Future.delayed(Duration(seconds: 2), (){
      offNavigator(context: context,PageName: LoginScreen());
    });
  }
}