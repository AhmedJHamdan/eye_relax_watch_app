import 'dart:async';

import 'package:flutter/material.dart';

class SlidingButtonWidget extends StatefulWidget {
  const SlidingButtonWidget(this.buttonText, this.onTap, {super.key});

  final String? buttonText;
  final void Function() onTap;

  @override
  State createState() => _SlidingButtonWidgetState();
}

class _SlidingButtonWidgetState extends State<SlidingButtonWidget> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Start a timer to make the button appear after a delay
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 800),
          offset: _isVisible ? const Offset(0, 0) : const Offset(0, 1),
          child: GestureDetector(
            onTap: widget.onTap,
            child: ClipPath(
              clipper: SemicircleClipper(),
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.black38,
                      Colors.black45,
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(widget.buttonText ?? "",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class SemicircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
