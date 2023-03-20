  import 'package:flutter/material.dart';
  
  Widget create_list_label({
    required String label,
  }) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10,10,5,0),
        child: Title(
          color: const Color.fromARGB(255, 75, 94, 112),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 75, 94, 112),
            ),
          ),
        ));
  }