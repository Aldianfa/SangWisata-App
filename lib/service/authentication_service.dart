import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_auth/firebase_auth.dart";
import '../exception/auth_exception_handler.dart';

class AuthenticationService {
  late AuthResultStatus status;

  // Login with email and password
  Future<AuthResultStatus> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        status = AuthResultStatus.successful;
      } else {
        // status = AuthResultStatus.undefined;
        // print error message
        print('Error: ${status.toString()}');
      }
      return status;
    } catch (msg) {
      status = AuthExceptionHandler.handleException(msg);
    }
    return status;
  }

  // Register with name, email and password
  Future<AuthResultStatus> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        _saveUserDetails(
          name: name,
          email: email,
          userId: authResult.user!.uid,
        );
        status = AuthResultStatus.successful;
      } else {
        status = AuthResultStatus.undefined;
        // print error message
        // print('Error: ${status.toString()}');
      }
      return status;
    } catch (msg) {
      status = AuthExceptionHandler.handleException(msg);
    }
    return status;
  }

  void _saveUserDetails({
    required String name,
    required String email,
    required String userId,
  }) {
    // save user details to firestore
    FirebaseFirestore.instance.collection('users').doc(userId).set({
      'name': name,
      'email': email,
      'userId': userId,
    });
  }

}
