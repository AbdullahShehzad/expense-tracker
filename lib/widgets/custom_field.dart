import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hintText;
  final Color backgroundColor;
  final Color titleColor;
  final Color suffixColor;

  const CustomField({
    required this.textEditingController,
    required this.title,
    required this.hintText,
    this.titleColor = const Color(0xFFFFFFFF),
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.suffixColor = const Color(0xFF91919F),
    super.key,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();

    if (widget.title == 'Password') {
      obscureText = true;
    }
  }

  String? validator(String? value) {
    switch (widget.title) {
      case 'Email':
        return value != null && !value.contains('@')
            ? 'Enter a valid email'
            : null;
      case 'Password' || 'New Password' || 'Confirm Password':
        return value != null && value.length < 8
            ? 'Password must be at least 8 characters'
            : null;
      case 'Name':
      case 'Contact':
      case 'Country':
      case 'City':
        return (value == null || value.isEmpty)
            ? 'This field cannot be empty'
            : null;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 3,
          ),
          child: Text(
            widget.title,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: widget.titleColor,
              letterSpacing: -0.5,
            ),
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        TextFormField(
          controller: widget.textEditingController,
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.black,
            letterSpacing: -0.5,
          ),
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: widget.title == 'Password' ||
                    widget.title == 'New Password' ||
                    widget.title == 'Confirm Password'
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: widget.suffixColor,
                    ),
                  )
                : null,
            fillColor: widget.backgroundColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),
            hintText: widget.hintText,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
