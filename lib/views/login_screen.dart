import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_demo/main.dart';
import 'package:login_demo/views/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();

  final _userpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Login With Credentials",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _userpasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  checkLogin(context);
                },
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _userpasswordController.text;

    if (!_username.isEmpty && !_password.isEmpty && _username == _password) {
      // goto home
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      Get.offAll(() => (HomeScreen()));

      //
    } else {
      const _errorMessege = 'username and password does not match';
      // snackBar
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 5),
          content: Text(
            _errorMessege,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );
    }
  }
}
