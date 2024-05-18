// ignore_for_file: unused_field

import 'dart:math';
import 'package:blackjackui/suits.dart';
import 'package:flutter/material.dart';
import 'package:blackjackui/cardtemplate.dart';
import 'package:blackjackui/card.dart'; // Ensure this import is correct and necessary

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    Widget getFlippingCard(String number, Widget suit, Color color) {
      return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(pi * _animation.value),
        child: GestureDetector(
          onTap: () {
            if (_animationStatus == AnimationStatus.dismissed) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
          },
          child: _animation.value >= 0.5
              ? const CardBack()
              : CardTemplate(
                  color: color,
                  number: number,
                  suit: suit,
                ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.green[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardTemplate(
                  color: Colors.black,
                  number: "10",
                  suit: clover(),
                ),
                CardTemplate(
                  color: Colors.red,
                  number: "J",
                  suit: heart(),
                ),
              ],
            ),
            Transform.rotate(
              angle: pi / 2,
              child: const CardBack(),
            ), // Assuming CardBack is a stateless widget with no dynamic data
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardTemplate(
                  color: Colors.black,
                  number: "Q",
                  suit: spade(),
                ),
                getFlippingCard("A", diamond(), Colors.red)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
