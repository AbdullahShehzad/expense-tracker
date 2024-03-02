import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinancialReportScreen extends StatefulWidget {
  const FinancialReportScreen({super.key});

  @override
  State<FinancialReportScreen> createState() => _FinancialReportScreenState();
}

class _FinancialReportScreenState extends State<FinancialReportScreen> {
  bool _showIncome = false;

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
    List<PieChartSectionData> sections = _showIncome
        ? _getSections(
            transactions.where((t) => int.parse(t['amount']!) > 0).toList())
        : _getSections(
            transactions.where((t) => int.parse(t['amount']!) < 0).toList());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Financial Report',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text(_showIncome ? 'Show Expenses' : 'Show Income'),
            value: _showIncome,
            onChanged: (value) {
              setState(() {
                _showIncome = value;
              });
            },
          ),
          Expanded(
            child: PieChart(
              PieChartData(
                sections: sections,
                centerSpaceRadius: 100,
                sectionsSpace: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _getSections(List<Map<String, String>> data) {
    final isIncome = int.parse(data.first['amount']!) > 0;
    final colorList = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
      Colors.brown,
      Colors.grey,
    ];

    return List.generate(
      data.length,
      (index) {
        final value = isIncome
            ? int.parse(data[index]['amount']!)
            : int.parse(data[index]['amount']!) * -1;

        final color = colorList[index % colorList.length];
        return PieChartSectionData(
          color: color,
          value: value.toDouble(),
          title: '',
          radius: 20,
          titleStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        );
      },
    );
  }
}
