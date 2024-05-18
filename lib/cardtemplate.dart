// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:math';
import 'package:flutter/material.dart';
//import 'suits.dart'; // Ensure this import is correct and necessary

class CardTemplate extends StatelessWidget {
  final Widget suit;
  final Color color;
  final String number;

  const CardTemplate({
    super.key,
    required this.suit,
    required this.color,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          height: 150,
          width: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      number,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                suit,
                Transform.rotate(
                  angle: pi,
                  child: Row(
                    children: [
                      Text(
                        number,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
