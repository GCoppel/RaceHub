import 'package:flutter/material.dart';
import 'package:RaceHub/widgets/create_list_label.dart';
import 'package:RaceHub/widgets/create_schedule_item.dart';
import 'package:RaceHub/event.dart';

class event_details_page extends StatelessWidget {
  event_details_page({
    Key? key,
    required this.eventObject,
  }) : super(key: key);

  Event_Object eventObject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eventObject.EventName),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        backgroundColor: Color(int.parse(eventObject.EventColorCode)),
        //backgroundColor: Color(int.parse(eventObject.EventColorCode)),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
            height: 100,
            child: Image.asset("images/${eventObject.EventLogo}", width: 150),
          ),
          //Add Results widget that knows if an event has passed or not and return accordingly
          create_list_label(label: "Schedule:"),
          for (var session in eventObject.Sessions)
            create_schedule_item(
                sessionName: session.SessionName,
                sessionTime: DateTime.parse(session.SessionStart + "Z"),
                mainEvent: session.MainEvent),
        ],
      ),
    );
  }
}
