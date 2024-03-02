import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Currency extends StatefulWidget {
  final String curr;
  const Currency({super.key, required this.curr});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  bool pkr = false;
  bool usd = false;
  bool jpy = false;
  bool rub = false;
  bool eur = false;

  @override
  void initState() {
    isVisibile();
    super.initState();
  }

  void isVisibile() {
    if (widget.curr == "PKR") {
      pkr = true;
    } else if (widget.curr == "USD") {
      usd = true;
    } else if (widget.curr == "JPY") {
      jpy = true;
    } else if (widget.curr == "RUB") {
      rub = true;
    } else if (widget.curr == "EUR") {
      eur = true;
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
                    'Currency',
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
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                ),
                onPressed: () {
                  pkr = true;
                  usd = false;
                  jpy = false;
                  rub = false;
                  eur = false;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pakistan (PKR)',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      pkr == true
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
                  pkr = false;
                  usd = true;
                  jpy = false;
                  rub = false;
                  eur = false;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'United States (USD)',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      usd == true
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
                  pkr = false;
                  usd = false;
                  jpy = true;
                  rub = false;
                  eur = false;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Japan (JPY)',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      jpy == true
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
                  pkr = false;
                  usd = false;
                  jpy = false;
                  rub = true;
                  eur = false;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Russia',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      rub == true
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
                  pkr = false;
                  usd = false;
                  jpy = false;
                  rub = false;
                  eur = true;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Germany',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      eur == true
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
    );
  }
}
