import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:RaceHub/widgets/create_list_label.dart';
import 'package:RaceHub/widgets/series_grid.dart';

class addEventPage extends StatefulWidget {
  const addEventPage({super.key});

  @override
  State<addEventPage> createState() => _addEventPageState();
}

class _addEventPageState extends State<addEventPage> {
  final seriesList = [
    'Select Series:',
    'Formula 1',
    'WEC',
    'IMSA',
    'Indycar',
    'WRC',
    'Supercars',
    'Formula E',
    'Super Formula',
    'W Series',
    'GT Europe',
    'WTCR',
    'Praga Cup UK',
    'Formula 2',
    'Formula 3'
  ];

  String? selectedSeries = "Select Series:";

  String? sessionNum = "0";

  bool? showOverride = false;

  String? overrideCode = "";

  List<int?> sessionTypeList = [
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4
  ]; // 4 makes them all unselected to begin

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add an Event",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 75, 94, 112),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1),
                ),
                margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Column(
                  children: [
                    create_list_label(label: "IMPORTANT"),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        "Please ensure that you follow the common styling of the series you are adding to. Check the series' page for examples on the proper event and session names as well as which sessions are listed.",
                        style: TextStyle(height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )),

            create_list_label(label: "Series:"),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedSeries,
                  isExpanded: true,
                  items: seriesList.map(buildMenuItem).toList(),
                  onChanged: ((value) {
                    setState(() {
                      this.selectedSeries = "0";
                      this.selectedSeries = value;
                    });
                  }),
                ),
              ),
            ),
            if (selectedSeries != "Select Series:")
              Container(
                child: Column(
                  children: [
                    create_list_label(label: "Add Event Details:"),

                    //Event Name:
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Event Name',
                        ),
                      ),
                    ),

                    //Event Start Date & Time:
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Start Date & Time (YYYY-MM-DD HH:MM)',
                        ),
                      ),
                    ),

                    //Event End Date & Time:
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'End Date & Time',
                        ),
                      ),
                    ),

                    //Number of Sessions:
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            if (value != '')
                              this.sessionNum =
                                  value; //Check if TextField is empty
                            else
                              this.sessionNum = '0'; //Return '0' if empty
                          });
                        },
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Number of Sessions',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            //Session Form Fields:
            if ((int.parse(sessionNum!)) > 10) //Too many sessions warning
              Container(
                child: Text(
                  "Events may have no more than 10 sessions.",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            if ((int.parse(sessionNum!)) <= 10 &&
                (int.parse(sessionNum!)) > 0) //List Generator
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 10,
                      ),
                      child: create_list_label(label: "Add Session Details:"),
                    ),
                    for (int i = 1; i < int.parse(sessionNum!) + 1; i++)
                      Column(
                        children: [
                          //Session # Label:
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
                            child: Text(
                              "Session $i:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          //Session detail field groups:
                          sessionDetails(i - 1),
                          //Divider:
                        ],
                      ),
                  ],
                ),
              ),

            //Override Button:
            if (sessionNum != "0")
              Container(
                  margin: EdgeInsets.fromLTRB(110, 15, 110, 10),
                  child: ListTile(
                    tileColor: Color.fromARGB(75, 96, 125, 139),
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Color.fromARGB(75, 0, 0, 0),
                        width: 3,
                      ),
                    ),
                    title: Text(
                      "Override",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(100, 0, 0, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      setState(() {
                        if (showOverride == false)
                          this.showOverride = true;
                        else
                          this.showOverride = false;
                      });
                    },
                  )),
            if (showOverride == true && sessionNum != "0")
              Container(
                margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          this.overrideCode = value;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: 'Override Code',
                      ),
                    )
                  ],
                ),
              ),

            //Submit Button:
            if (sessionNum != "0")
              Container(
                margin: EdgeInsets.fromLTRB(75, 15, 75, 50),
                child: ListTile(
                  tileColor: Colors.blueGrey,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.blueGrey,
                      width: 5,
                    ),
                  ),
                  title: Text(
                    "Submit",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    if (overrideCode == "testing")
                      print("success");
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget sessionDetails(int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: .1)),
      ),
      child: Column(
        children: [
          //Session Name:
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                labelText: 'Session Name',
              ),
            ),
          ),

          //Session Start Date & Time:
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                labelText: 'Start Date & Time',
              ),
            ),
          ),

          //Session Type (Multiple Choice):
          Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Wrap(
                children: List<Widget>.generate(3, (int sessionIndex) {
                  String sessionTypeName = "";
                  if (sessionIndex == 0) sessionTypeName = "Practice";
                  if (sessionIndex == 1) sessionTypeName = "Qualifying";
                  if (sessionIndex == 2) sessionTypeName = "Race";
                  return Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ChoiceChip(
                      label: Text(sessionTypeName),
                      selected: sessionTypeList[index] == sessionIndex,
                      selectedColor: Color.fromARGB(255, 136, 182, 207),
                      onSelected: (bool selected) {
                        setState(
                          () {
                            sessionTypeList[index] =
                                selected ? sessionIndex : null;
                          },
                        );
                      },
                    ),
                  );
                }),
              )),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
      );
}
