import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Profession extends StatelessWidget {
  String profession;
  String email;
  Color color;
  Profession({
    Key? key,
    required this.color,
    required this.email,
    required this.profession,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {
            launch("mailto:$email");
          },
          child: SizedBox(
            height: 60,
            width: 150,
            child: Column(
              children: [
                Text(
                  profession,
                  style: GoogleFonts.oswald(
                    fontSize: 20,
                    color: color,
                  ),
                ),
                Text(
                  "Available now",
                  style: GoogleFonts.oswald(
                    fontSize: 15,
                    color: color,
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
