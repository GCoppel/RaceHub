import 'package:flutter/material.dart';
import 'package:RaceHub/update_database_page.dart';

Widget update_database_button({
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
        "Update Database",
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => update_database_page(),
          ),
        );
      },
    ),
  );
}
