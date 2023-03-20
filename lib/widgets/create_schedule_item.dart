import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget create_schedule_item({
  required String sessionName,
  required DateTime sessionTime,
  required String mainEvent,
}) {
  if (mainEvent == "true") {
return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: .1)),
      ),
      child: ListTile(
        leading: Container(
          width: 100,
          child: Text(
            sessionName,
            style: TextStyle(
              fontSize: 17, //Another difference (2pts bigger)
              fontWeight: FontWeight.bold, //The only difference between this and the non-"mainEvent" branch
            ),
          ),
        ),
        trailing: Container(
          width: 50,
          height: 50,
          child: Column(children: [
            Icon(Icons.alarm),
            Text("Remind Me", style: TextStyle(fontSize: 8)),
          ]),
        ),
        isThreeLine: true,
        title: Text(DateFormat('EEEE, d MMM, yyyy').format(sessionTime)),
        subtitle: Text(
            sessionTime.toUtc().timeZoneName +
            ": " +
            sessionTime.toUtc().hour.toString().padLeft(2, "0") +
            ":" +
            sessionTime.minute.toString().padLeft(2, "0") +
            "\nYour Time (${sessionTime.toLocal().timeZoneName}): " +
            sessionTime.toLocal().hour.toString().padLeft(2, "0") +
            ":" +
            sessionTime.minute.toString().padLeft(2, "0")),
      ),
    );
  }
  else {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: .1)),
      ),
      child: ListTile(
        leading: Container(
          width: 100,
          child: Text(
            sessionName,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        trailing: Container(
          width: 50,
          height: 50,
          child: Column(children: [
            Icon(Icons.alarm),
            Text("Remind Me", style: TextStyle(fontSize: 8)),
          ]),
        ),
        isThreeLine: true,
        title: Text(DateFormat('EEEE, d MMM, yyyy').format(sessionTime)),
        subtitle: Text(
            sessionTime.timeZoneName +
            ": " +
            sessionTime.hour.toString().padLeft(2, "0") +
            ":" +
            sessionTime.minute.toString().padLeft(2, "0") +
            "\nYour Time (${sessionTime.toLocal().timeZoneName}): " +
            sessionTime.toLocal().hour.toString().padLeft(2, "0") +
            ":" +
            sessionTime.minute.toString().padLeft(2, "0")),
      ),
    );
  }
}
