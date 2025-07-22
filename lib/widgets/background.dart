import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/ellipse-blue.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/ellipse-purple.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
