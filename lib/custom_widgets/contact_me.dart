import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  String fbLink;
  String linkedInLink;
  String email;
  Color color;
  ContactMe({
    Key? key,
    required this.color,
    required this.fbLink,
    required this.email,
    required this.linkedInLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 85,
          width: 100,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  launch("https://$fbLink");
                },
                child: Text(
                  "Facebook",
                  style: GoogleFonts.oswald(
                    fontSize: 18,
                    color: color,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  launch("https://$linkedInLink");
                },
                child: Text(
                  "Linked In",
                  style: GoogleFonts.oswald(
                    fontSize: 18,
                    color: color,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  launch("mailto:$email");
                },
                child: Text(
                  "Contact Me",
                  style: GoogleFonts.oswald(
                    fontSize: 18,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
