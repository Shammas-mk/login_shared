import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_demo/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  String datetime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("HomeScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              datetime,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                logout();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }

  logout() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Get.offAll(LoginScreen());
  }
}
