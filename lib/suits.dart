import 'package:flutter/material.dart';

Widget heart() {
  return Text("♥", style: TextStyle(color: Colors.red[800], fontSize: 60));
}

Widget diamond() {
  return Text("♦", style: TextStyle(color: Colors.red[800], fontSize: 60));
}

Widget spade() {
  return const Text("♠", style: TextStyle(color: Colors.black, fontSize: 60));
}

Widget clover() {
  return const Text("♣", style: TextStyle(color: Colors.black, fontSize: 60));
}
