import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_demo/main.dart';
import 'package:login_demo/views/home_screen.dart';
import 'package:login_demo/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  goToLogin() async {
    Future.delayed(const Duration(seconds: 4));
    await Get.to(() => const LoginScreen());
  }

  checkUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      goToLogin();
    } else {
      Get.to(() => HomeScreen());
    }
  }
}
