import 'package:flutter/material.dart';
import 'package:RaceHub/addEventPage.dart';
import 'package:RaceHub/widgets/create_list_label.dart';

class update_database_page extends StatefulWidget {
  const update_database_page({super.key});

  @override
  State<update_database_page> createState() => _update_database_pageState();
}

class _update_database_pageState extends State<update_database_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help Update Our Database",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 75, 94, 112),
      ),
      body: ListView(
        children: [
          //Review Other's Changes:
          create_list_label(label: "Pending Additions/Modifications:"),

          //Add Event
          create_list_label(label: "Add or Modify an Event:"),

          Row(
            mainAxisSize:MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),

          //Add Event
          Container(
            margin: const EdgeInsets.fromLTRB(25, 8, 25, 0),
            child: ListTile(
              leading: Icon(Icons.add),
              shape: StadiumBorder(
                side: BorderSide(
                  color: Color.fromARGB(255, 75, 94, 112),
                  width: 2,
                ),
              ),
              title: Text(
                "Add Event",
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 94, 112),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => addEventPage(),
                  ),
                );
              },
            ),
          ),

          //Modify Event
          Container(
            margin: const EdgeInsets.fromLTRB(25, 8, 25, 0),
            child: ListTile(
              leading: Icon(Icons.edit),
              shape: StadiumBorder(
                side: BorderSide(
                  color: Color.fromARGB(255, 75, 94, 112),
                  width: 2,
                ),
              ),
              title: Text(
                "Modify Event",
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 94, 112),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => addEventPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
