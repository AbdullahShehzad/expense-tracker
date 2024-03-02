import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Language extends StatefulWidget {
  final String lang;
  const Language({super.key, required this.lang});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  bool en = false;
  bool id = false;
  bool ar = false;
  bool zh = false;
  bool nl = false;
  bool fr = false;
  bool de = false;
  bool it = false;
  bool ko = false;
  bool pt = false;
  bool ru = false;
  bool es = false;

  @override
  void initState() {
    isVisibile();
    super.initState();
  }

  void isVisibile() {
    if (widget.lang == "English") {
      en = true;
    } else if (widget.lang == "Indonesian") {
      id = true;
    } else if (widget.lang == "Arabic") {
      ar = true;
    } else if (widget.lang == "Chinese") {
      zh = true;
    } else if (widget.lang == "Dutch") {
      nl = true;
    } else if (widget.lang == "French") {
      fr = true;
    } else if (widget.lang == "German") {
      de = true;
    } else if (widget.lang == "Italian") {
      it = true;
    } else if (widget.lang == "Korean") {
      ko = true;
    } else if (widget.lang == "Portugese") {
      pt = true;
    } else if (widget.lang == "Russian") {
      ru = true;
    } else if (widget.lang == "Spanish") {
      es = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF918C8C),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE9AB17),
            Color(0xFf5D4303),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    color: Colors.black,
                    iconSize: 28, // Size of the icon
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Language',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_rounded,
                    ),
                    color: Colors.transparent,
                    iconSize: 28, // Size of the icon
                    onPressed: () {
                      print('Icon Button Pressed!');
                    },
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = true;
                          id = false;
                          ar = false;
                          zh = false;
                          nl = false;
                          fr = false;
                          de = false;
                          it = false;
                          ko = false;
                          pt = false;
                          ru = false;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'English (EN)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              en == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = true;
                          ar = false;
                          zh = false;
                          nl = false;
                          fr = false;
                          de = false;
                          it = false;
                          ko = false;
                          pt = false;
                          ru = false;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Indonesian (ID)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              id == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = false;
                          ar = true;
                          zh = false;
                          nl = false;
                          fr = false;
                          de = false;
                          it = false;
                          ko = false;
                          pt = false;
                          ru = false;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Arabic (AR)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ar == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = false;
                          ar = false;
                          zh = true;
                          nl = false;
                          fr = false;
                          de = false;
                          it = false;
                          ko = false;
                          pt = false;
                          ru = false;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Chinese (ZH)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              zh == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = false;
                          ar = false;
                          zh = false;
                          nl = true;
                          fr = false;
                          de = false;
                          it = false;
                          ko = false;
                          pt = false;
                          ru = false;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Dutch (NL)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              nl == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = false;
                          ar = false;
                          zh = false;
                          nl = false;
                          fr = true;
                          de = false;
                          it = false;
                          ko = false;
                          pt = false;
                          ru = false;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'French (FR)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              fr == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = false;
                          ar = false;
                          zh = false;
                          nl = false;
                          fr = false;
                          de = true;
                          it = false;
                          ko = false;
                          pt = false;
                          ru = false;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'German (DE)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              de == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = false;
                          ar = false;
                          zh = false;
                          nl = false;
                          fr = false;
                          de = false;
                          it = true;
                          ko = false;
                          pt = false;
                          ru = false;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Italian (IT)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              it == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = false;
                          ar = false;
                          zh = false;
                          nl = false;
                          fr = false;
                          de = false;
                          it = false;
                          ko = true;
                          pt = false;
                          ru = false;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Korean (KO)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ko == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = false;
                          ar = false;
                          zh = false;
                          nl = false;
                          fr = false;
                          de = false;
                          it = false;
                          ko = false;
                          pt = true;
                          ru = false;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Portugese (PT)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              pt == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = false;
                          ar = false;
                          zh = false;
                          nl = false;
                          fr = false;
                          de = false;
                          it = false;
                          ko = false;
                          pt = false;
                          ru = true;
                          es = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Russian (RU)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ru == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          en = false;
                          id = false;
                          ar = false;
                          zh = false;
                          nl = false;
                          fr = false;
                          de = false;
                          it = false;
                          ko = false;
                          pt = false;
                          ru = false;
                          es = true;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Spanish (ES)',
                                style: TextStyle(
                                  color: Color(0xFF392800),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              es == true
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF392800),
                                      size: 24,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ],
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
