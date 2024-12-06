import 'package:flutter/material.dart';



class CustomBtnWidget extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  double radius = 20;
  final TextStyle textStyle;
  final Size size;
  Function onPress;
  CustomBtnWidget({required this.title, required this.backgroundColor, required this.size, required this.textStyle, double radius = 20, required Function this.onPress});

  @override
  State<CustomBtnWidget> createState() => _CustomBtnWidgetState();
}

class _CustomBtnWidgetState extends State<CustomBtnWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(widget.title, style: widget.textStyle),
      style: TextButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.radius)),
        fixedSize: widget.size
      ),
      onPressed: () {
        widget.onPress!();
      }, 
    );
  }
}