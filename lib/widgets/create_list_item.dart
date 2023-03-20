import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:RaceHub/event.dart';
import 'package:RaceHub/event_details_page.dart';

Widget create_list_item({
  required Event_Object event,
  required String name,
  required Image image,
  required DateTime dateCurrent,
  required DateTime dateEventStart,
  required DateTime dateEventEnd,
  required Color color,
  required BuildContext itemContext,
}) {
  int roundUp = 0;
  final difference = dateEventStart.difference(dateCurrent); //Get time until event
  if (dateEventStart.hour < dateCurrent.hour){ //Find if part of a day has already passed, and round the difference up 1
    roundUp = 1;
  }
  return Container(
    margin: const EdgeInsets.all(5),
    //height: 150,
    child: ListTile(
      isThreeLine: true,
      tileColor: null, //Makes tile transparent for dark mode compatibility
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      leading: image,
      title: Text(name),
      subtitle: Text(DateFormat('EEEE, d MMM, yyyy').format(dateEventStart) +
          " - \n" +
          DateFormat('EEEE, d MMM, yyyy').format(dateEventEnd)),
      trailing: Text(
        "In\n" + (difference.inDays+roundUp).toString() + "\nDays",
        textAlign: TextAlign.center,
      ),
      onTap: () {
        Navigator.of(itemContext).push(MaterialPageRoute(
            builder: (context) => event_details_page(
                  eventObject: event,
                )));
      },
    ),
  );
}
