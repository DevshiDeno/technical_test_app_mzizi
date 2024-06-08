import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:technical_test_app_mzizi/authentication/screen/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_app_mzizi/screens/widgets/Trianglevector.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //alignment: Alignment.center,
              height: 350,
             // color: Colors.lightGreen,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top:80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              '\$',
                              style: GoogleFonts.roboto(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              '\$',
                              style: GoogleFonts.roboto(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    child: Image.asset(
                      'assets/images/background.png',
                      width: 268.46,
                      height: 159.92,
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset(
                      'assets/images/left.png',
                      width: 59.58,
                      height: 101.81,
                    ),
                    const SizedBox(width: 20),
                    Image.asset(
                      'assets/images/right.png',
                      width: 59.58,
                      height: 101.81,
                    ),
                  ]),
                  Positioned(
                    left: 145,
                    child: Transform.rotate(
                        angle: -70,
                        child:
                            TriangularShape()), // Triangular shape at the center of left image
                  ),
                  Positioned(
                    right: 145,
                    child: Transform.rotate(
                        angle: 90,
                        child:
                            TriangularShape()), // Triangular shape at the center of right image
                  ),
                ],
              ),
            ),
          //  const SizedBox(height: 75),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
             //   color: Colors.red,
                alignment: Alignment.bottomCenter,
                width: 354,
                // height: 80,
                child: Text(
                  'Stay on top of your \n finance with us.',
                  style: GoogleFonts.dmSans(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 354,
              height: 66,
              child: Text(
                'We are your new financial Advisors '
                '\n to recommend the best investments for '
                '\n you.',
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 70),
            Center(
              child: Container(
                width: 344,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccount()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: Text(
                    'Create account',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.lightGreen,
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
