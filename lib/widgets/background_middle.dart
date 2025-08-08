import 'package:flutter/material.dart';

class BackgroundMiddle extends StatelessWidget {
  final Widget child;

  const BackgroundMiddle({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/ellipse-blue-middle.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}