import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sangwisata3/view/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => LoginView())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img/logo_sangwisata.png', height: 75, fit: BoxFit.cover),
            SizedBox(height: 24),
            CircularProgressIndicator(
              color: Colors.brown,
            ),
          ],
        ),
      ),
    );
  }
}
