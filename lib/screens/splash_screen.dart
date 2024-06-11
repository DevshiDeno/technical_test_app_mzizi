import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_app_mzizi/screens/landing_page.dart';

import '../authentication/screen/sign_up_screen.dart';
import '../provider/auth_provider.dart';
import 'home_page_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final authProvider =
        Provider.of<UserSignUpProvider>(context, listen: false);

    Future.delayed(const Duration(milliseconds: 2800), () async {
      if (mounted) {
        await authProvider.autoLogin(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 160,
              height: 120,
              child: Image.asset('assets/images/splashImage.png'),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
