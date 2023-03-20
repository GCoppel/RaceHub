// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:RaceHub/settings.dart';
// import 'package:RaceHub/widgets/create_list_label.dart';

// class notification_settings_page extends StatefulWidget {
//   const notification_settings_page({super.key});

//   @override
//   State<notification_settings_page> createState() =>
//       _notification_settings_pageState();
// }

// class _notification_settings_pageState
//     extends State<notification_settings_page> {

// Settings appSettings = Settings(showPastEvents: true, darkMode: false, showOnHomepage: [], notifications: []);

//   // bool showPastEvents = false;
//   // bool darkMode = false;

//   List<bool> _isExpanded = List.filled(14, false);

//   // List<bool> status = List.filled(56, false);
//   // int statusIndex = 0;

//   Future<void> readJson() async {
//     final response = await rootBundle.loadString('json/settings.json');
//     final data = await json.decode(response);

//     appSettings = Settings.fromJson(data[0]); //here
//   }

//   @override
//   Widget build(BuildContext context) {
//     readJson();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "App Settings",
//           style: TextStyle(
//             fontSize: 20,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 75, 94, 112),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             //APPLY BUTTON:
//             Container(
//               margin: EdgeInsets.fromLTRB(75, 15, 75, 10),
//               child: ListTile(
//                 tileColor: Colors.blueGrey,
//                 contentPadding: EdgeInsets.zero,
//                 visualDensity: VisualDensity(horizontal: -4, vertical: -4),
//                 shape: StadiumBorder(
//                   side: BorderSide(
//                     color: Colors.blueGrey,
//                     width: 5,
//                   ),
//                 ),
//                 title: Text(
//                   "Apply",
//                   style: const TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 onTap: () {},
//               ),
//             ),
//             //SHOW PAST EVENTS ON HOMEPAGE SWITCH & LABEL:
//             Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(15, 25, 10, 25),
//                   child: FlutterSwitch(
//                       activeColor: Color.fromARGB(255, 73, 154, 191),
//                       width: 50,
//                       height: 25,
//                       valueFontSize: 10,
//                       toggleSize: 20,
//                       value: appSettings.showPastEvents,
//                       borderRadius: 1000,
//                       padding: 5,
//                       showOnOff: true,
//                       onToggle: (val) {
//                         setState(() {
//                           appSettings.showPastEvents = val;
//                         });
//                       }),
//                 ),
//                 Text(
//                   "Show past events on homepage",
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),

//             //DARK MODE SWITCH & LABEL:
//             Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(15, 0, 10, 25),
//                   child: FlutterSwitch(
//                       activeColor: Color.fromARGB(255, 73, 154, 191),
//                       width: 50,
//                       height: 25,
//                       valueFontSize: 10,
//                       toggleSize: 20,
//                       value: appSettings.darkMode,
//                       borderRadius: 1000,
//                       padding: 5,
//                       showOnOff: true,
//                       onToggle: (val) {
//                         setState(() {
//                           appSettings.darkMode = val;
//                         });
//                       }),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
//                   child: Text(
//                     "Use dark mode (restart required)",
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             create_list_label(label: "Series & Notification Settings:"),
//             ExpansionPanelList(
//               animationDuration: Duration(seconds: 1),
//               elevation: 1,
//               //expandedHeaderPadding: EdgeInsets.all(5),
//               expansionCallback: (panelIndex, isExpanded) {
//                 setState(() {
//                   _isExpanded[panelIndex] = !isExpanded;
//                 });
//               },
//               children: <ExpansionPanel>[
//                 seriesSettingsPanel(0, 0, "images/f1_logo.png", "Formula 1"),
//                 seriesSettingsPanel(1, 4, "images/wec_logo.png", "WEC"),
//                 seriesSettingsPanel(2, 8, "images/imsa_logo.png", "IMSA"),
//                 seriesSettingsPanel(
//                     3, 12, "images/indycar_logo.png", "NTT Indycar Series"),
//                 seriesSettingsPanel(
//                     4, 16, "images/wrc_logo.png", "World Rally Championship"),
//                 seriesSettingsPanel(
//                     5, 20, "images/supercars_logo.png", "Supercars"),
//                 seriesSettingsPanel(
//                     6, 24, "images/formula_e_logo.png", "ABB FIA Formula E"),
//                 seriesSettingsPanel(
//                     7, 28, "images/super_formula_logo.png", "Super Formula"),
//                 seriesSettingsPanel(
//                     8, 32, "images/w_series_logo.png", "W Series"),
//                 seriesSettingsPanel(
//                     9, 36, "images/gt_europe_logo.png", "GT Europe"),
//                 seriesSettingsPanel(10, 40, "images/wtcr_logo.png", "WTCR"),
//                 seriesSettingsPanel(
//                     11, 44, "images/praga_cup_logo.png", "Praga Cup UK"),
//                 seriesSettingsPanel(12, 48, "images/f2_logo.png", "Formula 2"),
//                 seriesSettingsPanel(13, 52, "images/f3_logo.png", "Formula 3")
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   ExpansionPanel seriesSettingsPanel(int expandIndex, int switchIndex,
//       String imageLocation, String seriesName) {
//     return ExpansionPanel(
//       backgroundColor: Colors.white,
//       canTapOnHeader: true,
//       isExpanded: _isExpanded[expandIndex],
//       headerBuilder: (context, isExpanded) {
//         return Container(
//           margin: EdgeInsets.all(15),
//           child: Row(
//             children: [
//               Container(
//                 width: 50,
//                 margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                 child: Image.asset(imageLocation),
//               ),
//               Text(
//                 seriesName,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//       body: Column(children: [
//         notificationItem("Show on homepage", switchIndex),
//         notificationItem("Notify me before PRACTICE sessions", switchIndex + 1),
//         notificationItem(
//             "Notify me before QUALIFYING sessions", switchIndex + 2),
//         notificationItem("Notify me before RACE sessions", switchIndex + 3),
//       ]),
//     );
//   }

//   Widget notificationItem(String itemName, int switchIndex) {
//     return Row(
//       children: [
//         Container(
//           margin: EdgeInsets.fromLTRB(15, 5, 10, 5),
//           child: FlutterSwitch(
//               activeColor: Color.fromARGB(255, 73, 154, 191),
//               width: 50,
//               height: 25,
//               valueFontSize: 10,
//               toggleSize: 20,
//               value: appSettings.notifications[1].notificationSettings[1],
//               borderRadius: 1000,
//               padding: 5,
//               showOnOff: true,
//               onToggle: (val) {
//                 setState(() {
//                   appSettings.notifications[1].notificationSettings[1] = val;
//                 });
//               }),
//         ),
//         Text(itemName),
//       ],
//     );
//   }
// }
