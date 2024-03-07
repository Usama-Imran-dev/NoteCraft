import 'package:flutter/material.dart';

class Conti extends StatelessWidget {
  final Color cx;
  final Function(Color cx) selx;

  Conti(this.cx, this.selx, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selx(cx), // Corrected the usage here
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: cx,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
