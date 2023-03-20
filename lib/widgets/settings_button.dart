import 'package:flutter/material.dart';
import 'package:RaceHub/settings_page.dart';

Widget settings_button({
  required BuildContext context,
}) {
  return Container(
      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        title: Text(
          "App Settings",
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SettingsPage(),
            ),
          );
        },
      ));
}
