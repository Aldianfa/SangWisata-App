import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sangwisata3/view/dashboard.dart';
import 'package:sangwisata3/view/login.dart';
import 'package:sangwisata3/view/register.dart';
import 'package:sangwisata3/view/splash.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          } else {
            if(snapshot.hasData){
              // User is logged in
              print('User is logged in');
              // return DashboardView(user: snapshot.data!);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DashboardView(user: snapshot.data!)),
                );
              });
              return const CircularProgressIndicator();
              
            } else {
              // User is not logged in
              print('User is not logged in');
              return const SplashScreen();
            }
          }
        }
      ),
    );
  }
}