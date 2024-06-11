import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:technical_test_app_mzizi/screens/home_page_screen.dart';

import '../authentication/screen/sign_up_screen.dart';
import '../screens/landing_page.dart';

class UserSignUpProvider extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  Future<void> signUp(
      String email, String password, String fullName, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateProfile(displayName: fullName);
      await userCredential.user?.reload();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
          content: Text('The password provided is too weak.'),
          duration: Duration(seconds: 2),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
          content: Text('The account already exists for that email.'),
          duration: Duration(seconds: 2),
        ));
      }
    }
    catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar( SnackBar(
          content: Text('User not logged in $e'),
      duration: const Duration(seconds: 2),
      ));
    }
  }

  Future<void> storeUserCredentials(
      String email, String password, String fullName) async {
    await storage.write(key: 'userEmail', value: email);
    await storage.write(key: 'userPassword', value: password);
  }

  Future<Map<String, String?>> getUserCredentials() async {
    String? email = await storage.read(key: 'userEmail');
    String? password = await storage.read(key: 'userPassword');
    return {'email': email, 'password': password};
  }

  Future<void> autoLogin(context) async {
    Map<String, String?> credentials = await getUserCredentials();
    String? email = credentials['email'];
    String? password = credentials['password'];

    if (email != null && password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } catch (e) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LandingPage()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    }
  }

  Future<void> deleteUserCredentials(context) async {
    await storage.delete(key: 'userEmail');
    await storage.delete(key: 'userPassword');
    await FirebaseAuth.instance.signOut().then((_) => {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const CreateAccount()))
        });
  }
}
