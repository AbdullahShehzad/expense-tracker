import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  final Function()? onPressed;
  final String text;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;

  const CustomButton({
    this.onPressed,
    required this.text,
    this.height = 40,
    this.width = 200,
    this.textColor = const Color(0xFF000000),
    this.backgroundColor = const Color(0xFFE9AB17),
    this.borderRadius = 10,
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widget.borderRadius,
            ),
          ),
          backgroundColor: widget.backgroundColor,
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
