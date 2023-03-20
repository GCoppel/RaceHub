import 'package:flutter/material.dart';
import 'package:RaceHub/home_page.dart';
import 'package:RaceHub/single_series_calendar.dart';

class SingleSeriesPage extends StatefulWidget {
  const SingleSeriesPage({
    Key? key,
    required this.seriesNum,
  }) : super(key: key);

  final int seriesNum;

  @override
  State<SingleSeriesPage> createState() => _SingleSeriesPageState();
}

class _SingleSeriesPageState extends State<SingleSeriesPage> {
  int currentPage = 0;
  List<Widget> pages = [
    SingleSeriesCalendar(seriesNum: 1),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined), label: "Events"),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: "Standings")
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
