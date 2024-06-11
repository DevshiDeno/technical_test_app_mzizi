import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Coin {
  final String name;
  final String percentageReturn;
  final LinearGradient gradient;
  final String image;

  const Coin({
    required this.gradient,
    required this.name,
    required this.percentageReturn,
    required this.image,
  });

  static List<Coin> coinList = [
     Coin(
        gradient: LinearGradient(
          begin: Alignment.topCenter, // Gradient start point
          end: Alignment.bottomCenter, // Gradient end point
          colors: [
            Color(0xFFF0C735).withOpacity(0.6), // Start color (Gold) with opacity
            Color(0xFFD98F39).withOpacity(0.6), // End color (Deep Gold) with opacity
            // End color (Deep Gold)
          ],
          stops: [0.0, 1.0], // Define stops for each color
        ),
        name: 'Gold',
        percentageReturn: '30% return',
        image: 'assets/images/gold.png'),
     Coin(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFC0C0C0).withOpacity(0.8), // Light silver color with opacity
            Color(0xFFA9A9A9).withOpacity(0.4), // Darker silver/gray color with opacity
          ],
          stops: [0.0, 1.0],
        ),
        name: 'Silver',
        percentageReturn: '60%',
        image: 'assets/images/silver.png'),
     Coin(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFB39DDB).withOpacity(0.6), // Light Purple
            Color(0xFF7B1FA2).withOpacity(0.6), // Purple
          ],
          stops: [0.0, 1.0], // Define stops for each color
        ),
        name: 'Platinum',
        percentageReturn: '90%',
        image: 'assets/images/platinum.png'),
  ];
}
