import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Dot/dot.dart';
import 'package:my_portfolio/custom_widgets/about.dart';
import 'package:my_portfolio/custom_widgets/contact_me.dart';
import 'package:my_portfolio/custom_widgets/name.dart';
import 'package:my_portfolio/custom_widgets/profession.dart';
import 'package:my_portfolio/details_view/details_view.dart';
import 'package:my_portfolio/projects.dart';
import 'package:url_launcher/url_launcher.dart';
import '../projects_map.dart';

class ShortView extends StatefulWidget {
  const ShortView({Key? key}) : super(key: key);

  @override
  _ShortViewState createState() => _ShortViewState();
}

class _ShortViewState extends State<ShortView> {
  List<Project> projects = [];

  @override
  void initState() {
    for (int i = 1; i <= projectMap.length; i++) {
      Project p = Project(
          projectMap[i]["Index"],
          projectMap[i]["Name"],
          projectMap[i]["Date"],
          projectMap[i]["Type"],
          projectMap[i]["Image"],
          projectMap[i]["Color"],
          projectMap[i]["BGColor"],
          Dot(projectMap[i]["Index"], projectMap.length, false));
      projects.add(p);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF36363b),
      body: LayoutBuilder(builder: (context, constraint) {
        return Stack(
          children: [
            ProjectsOutline(projects: projects),
            Name(
              color: Color(0xFFFFFFFF),
              name: "Saleque",
            ),
            About(
              color: Color(0xFFFFFFFF),
              onPressed: () {},
            ),
            Profession(
              color: Color(0xFFFFFFFF),
              email: "salequeahmed474@gmail.com",
              profession: "App Developer",
            ),
            ContactMe(
              color: Color(0xFFFFFFFF),
              email: "salequeahmed474@gmail.com",
              fbLink: "www.facebook.com/salek.ahm",
              linkedInLink: "www.linkedin.com/in/saleque-ahmed-j-53053010a/",
            ),
            Positioned(
                top: 25,
                left: constraint.maxWidth * 0.5 - (projects.length * 7),
                child: SizedBox(
                  width: constraint.maxWidth * 0.5,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...projects
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: e.dot,
                                ))
                            .toList()
                      ],
                    ),
                  ),
                ))
          ],
        );
      }),
    );
  }
}

class ProjectsOutline extends StatelessWidget {
  const ProjectsOutline({
    Key? key,
    required this.projects,
  }) : super(key: key);

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...projects
                .map((project) => ProjectClip(
                      project: project,
                      projects: projects,
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}

class ProjectClip extends StatefulWidget {
  final List<Project> projects;
  final Project project;
  const ProjectClip({
    Key? key,
    required this.project,
    required this.projects,
  }) : super(key: key);

  @override
  _ProjectClipState createState() => _ProjectClipState();
}

class _ProjectClipState extends State<ProjectClip> {
  double _height = 300;
  double _width = 100;
  Color _color = Colors.grey;

  void _toggle(bool boolean) {
    if (boolean) {
      setState(() {
        _height = 300;
        _width = 400;
        _color = Colors.transparent;
        widget.project.dot.toggle();
      });
    } else {
      setState(() {
        _height = 300;
        _width = 100;
        _color = Colors.grey;
        widget.project.dot.toggle();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (t) => _toggle(true),
      onExit: (t) => _toggle(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        margin: EdgeInsets.all(10.0),
        height: _height,
        width: _width,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    DetailsView(widget.project, widget.projects)));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.project.image,
              fit: BoxFit.fitHeight,
              colorBlendMode: BlendMode.saturation,
              color: _color,
            ),
          ),
        ),
      ),
    );
  }
}
