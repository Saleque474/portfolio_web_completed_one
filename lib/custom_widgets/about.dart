import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  const About({Key? key, required this.color, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              "About",
              style: GoogleFonts.oswald(
                fontSize: 18,
                color: color,
              ),
            )),
      ),
    );
  }
}
