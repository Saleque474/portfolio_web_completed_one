import 'package:flutter/material.dart';

class Dot extends StatefulWidget {
  final int index;
  final int length;
  bool boolean;
  Dot(
    this.index,
    this.length,
    this.boolean, {
    Key? key,
  }) : super(key: key);

  _DotState child = _DotState();
  toggle() => child._toggle();
  @override
  _DotState createState() => child;
}

class _DotState extends State<Dot> {
  late int index;
  late int length;

  late bool onPresent;

  void _toggle() => setState(() => onPresent = !onPresent);

  @override
  void initState() {
    onPresent = widget.boolean;
    index = widget.index;
    length = widget.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        height: onPresent ? 50 : 10,
        width: onPresent ? 50 : 10,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.white)),
        child: Center(
          child: Text(
            onPresent ? "$index / $length" : "",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
