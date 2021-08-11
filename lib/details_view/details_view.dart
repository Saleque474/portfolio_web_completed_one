import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/ShortView/short_view.dart';
import 'package:my_portfolio/custom_widgets/about.dart';
import 'package:my_portfolio/custom_widgets/contact_me.dart';
import 'package:my_portfolio/custom_widgets/name.dart';
import 'package:my_portfolio/custom_widgets/profession.dart';
import 'package:my_portfolio/Dot/dot.dart';
import '../projects.dart';

class DetailsView extends StatefulWidget {
  final List<Project> projects;
  final Project project;
  const DetailsView(this.project, this.projects, {Key? key}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late Project project;
  late bool isMobile;
  @override
  void initState() {
    project = widget.project;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: project.bgColor,
      body: LayoutBuilder(builder: (context, constraint) {
        constraint.maxWidth <= 480 ? isMobile = true : isMobile = false;
        return Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        if (project.index > 0)
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsView(
                                  widget.projects[project.index - 1],
                                  widget.projects)));
                      },
                      icon: Icon(
                        Icons.arrow_left,
                        size: 50,
                        color: project.color,
                      )),
                  SizedBox(
                    height: constraint.maxHeight * 0.6,
                    width: constraint.maxWidth * 0.6,
                    child: Image.asset(
                      project.image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (project.index < widget.projects.length - 1)
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsView(
                                  widget.projects[project.index + 1],
                                  widget.projects)));
                      },
                      icon: Icon(
                        Icons.arrow_right,
                        size: 50,
                        color: project.color,
                      ))
                ],
              ),
            ),
            Name(
              color: project.color,
              name: "Saleque",
            ),
            About(
              color: project.color,
              onPressed: () {},
            ),
            Profession(
              color: project.color,
              email: "salequeahmed474@gmail.com",
              profession: "App Developer",
            ),
            ContactMe(
              color: project.color,
              email: "salequeahmed474@gmail.com",
              fbLink: "www.facebook.com/salek.ahm",
              linkedInLink: "www.linkedin.com/in/saleque-ahmed-j-53053010a/",
            ),
            Align(
              alignment: Alignment(0, -0.8),
              child: IconButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ShortView())),
                  icon: Icon(
                    Icons.fullscreen_exit,
                    size: 50,
                    color: project.color,
                  )),
            ),
            Positioned(
                left: constraint.maxWidth * 0.3,
                bottom: isMobile ? 90 : 10,
                child: SizedBox(
                  width: isMobile ? 150 : constraint.maxWidth * 0.3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type :",
                            style: GoogleFonts.righteous(
                                color: project.color,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            project.type,
                            style: GoogleFonts.righteous(
                                color: project.color,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name :",
                            style: GoogleFonts.righteous(
                                color: project.color,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            project.name,
                            style: GoogleFonts.righteous(
                                color: project.color,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date :",
                            style: GoogleFonts.righteous(
                                color: project.color,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            project.date,
                            style: GoogleFonts.righteous(
                                color: project.color,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: 25,
                left: constraint.maxWidth * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Dot(project.index, widget.projects.length, true),
                ))
          ],
        );
      }),
    );
  }
}
