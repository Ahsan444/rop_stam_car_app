import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const AppText(
      {Key? key,
        this.color,
        this.fontSize,
        this.fontWeight,
        required this.text,
        this.textDecoration,
        this.textAlign,
        this.overflow,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      overflow: overflow,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.black,
        decoration: textDecoration ?? TextDecoration.none,
      ),
    );
  }
}
