import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Name extends StatelessWidget {
  final String name;
  final Color color;

  const Name({Key? key, required this.name, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          name,
          style: GoogleFonts.oswald(
            fontSize: 22,
            color: color,
          ),
        ),
      ),
    );
  }
}
