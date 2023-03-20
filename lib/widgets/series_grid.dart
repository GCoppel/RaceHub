import 'package:flutter/material.dart';

Widget series_grid() {
  return Container(
    child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: <Widget>[
        ListTile(
          title: Text("Item 1",
          textAlign: TextAlign.center,
          ),
          shape: BeveledRectangleBorder(
            side: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          onTap:() {
            
          },
        )
      ],
    ),
  );
}
