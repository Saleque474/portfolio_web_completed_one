import 'package:flutter/material.dart';

import 'Dot/dot.dart';

class Project {
  final int index;
  final String name;
  final String date;
  final String type;
  final String image;
  final Color color;
  final Color bgColor;
  final Dot dot;
  Project(this.index, this.name, this.date, this.type, this.image, this.color,
      this.bgColor, this.dot);
}
