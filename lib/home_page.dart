import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:RaceHub/drawer_list.dart';
import 'package:RaceHub/list_generator.dart';
import 'package:RaceHub/widgets/create_list_label.dart';
import 'package:RaceHub/widgets/create_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    return Scaffold(
      appBar: //PreferredSize(
        //preferredSize: Size.fromHeight(25.0), // here the desired height
        //child: 
        AppBar(
          //primary: false,
          title: Text(
            DateFormat('EEEE, d MMM, yyyy').format(datetime),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              //top: Radius.circular(15),
              bottom: Radius.circular(15),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 75, 94, 112),
        ),
      //),
      body: list_generator(
          [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13],
          "seriesName",
          const Color.fromARGB(255, 75, 94, 112),
          Image.asset("images/indycar_logo.png"),
          Image.asset("images/wec_logo.png"),
          false,
          context),
      endDrawer: DrawerList(),
    );
  }
}
