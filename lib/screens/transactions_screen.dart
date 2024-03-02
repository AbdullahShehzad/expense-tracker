import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_wise/constants/constants.dart';
import 'package:wallet_wise/screens/financial_report.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<Map<String, String>> transactions = [
    {
      'name': 'Shopping',
      'description': 'Buy some groceries',
      'amount': '-12000',
      'time': '10:00 AM'
    },
    {
      'name': 'Utilities',
      'description': 'Electricity bill',
      'amount': '-5000',
      'time': '02:00 PM'
    },
    {
      'name': 'Salary',
      'description': 'Monthly salary',
      'amount': '200000',
      'time': '09:00 AM'
    },
    {
      'name': 'Rent',
      'description': 'Monthly house rent',
      'amount': '-40000',
      'time': '12:00 PM'
    },
    {
      'name': 'Dining Out',
      'description': 'Dinner at restaurant',
      'amount': '-15000',
      'time': '07:00 PM'
    },
    {
      'name': 'Gym',
      'description': 'Gym membership fee',
      'amount': '-3000',
      'time': '11:00 AM'
    },
    {
      'name': 'Transportation',
      'description': 'Monthly subway pass',
      'amount': '-10000',
      'time': '08:00 AM'
    },
    {
      'name': 'Entertainment',
      'description': 'Movie tickets',
      'amount': '-8000',
      'time': '06:00 PM'
    },
    {
      'name': 'Gift',
      'description': 'Birthday gift for friend',
      'amount': '-25000',
      'time': '03:00 PM'
    },
    {
      'name': 'Savings',
      'description': 'Monthly savings deposit',
      'amount': '50000',
      'time': '01:00 PM'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FinancialReportScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: kYellowColor,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'See your financial report',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black38,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: transactions.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 36,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              transactions[index]['name']!,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                                letterSpacing: -0.5,
                              ),
                            ),
                            Text(
                              transactions[index]['description']!,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black38,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transactions[index]['amount']!,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black,
                              letterSpacing: -0.5,
                            ),
                          ),
                          Text(
                            transactions[index]['time']!,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 36,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 22,
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
