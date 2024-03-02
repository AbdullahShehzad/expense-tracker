import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hintText;

  const CustomField({
    required this.textEditingController,
    required this.title,
    required this.hintText,
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

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!value.contains('@')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
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
              color: Colors.white,
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
            suffixIcon: widget.title == 'Password'
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                      obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility,
                      color: const Color(0xFF91919F),
                    ),
                  )
                : null,
            fillColor: Colors.white,
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
          validator: widget.title == 'Email'
              ? _emailValidator
              : widget.title == 'Password'
                  ? _passwordValidator
                  : null,
        ),
      ],
    );
  }
}
