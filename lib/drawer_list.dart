import 'package:flutter/material.dart';
import 'package:RaceHub/settings_page.dart';
import 'package:RaceHub/single_series_calendar.dart';
import 'package:RaceHub/single_series_page.dart';
import 'package:RaceHub/widgets/settings_button.dart';
import 'package:RaceHub/widgets/update_database_button.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    double imageWidth = 50;
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 80, 98, 109),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: update_database_button(
              context: context,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: settings_button(
              context: context,
            ),
          ),
          Row(
            children: [
              Container(
                //height: 90,
                padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                child: const Text(
                  "Series Schedules",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const Spacer(), //Forces IconButton to right side
              // const IconButton(
              //     padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              //     onPressed: null,
              //     icon: Icon(Icons.settings, color: Colors.white)),
            ],
          ),
          _createDrawerItem(
            name: "Formula 1",
            color: const Color(0xFFFF1801),
            image: Image.asset("images/f1_logo.png", width: imageWidth),
            context: context,
            index: 0,
          ),
          _createDrawerItem(
            name: "World Endurance C...",
            color: const Color(0xFF8BC63E),
            image: Image.asset("images/wec_logo.png", width: imageWidth),
            context: context,
            index: 1,
          ),
          _createDrawerItem(
            name: "IMSA",
            color: const Color(0xFF8BC63E),
            image: Image.asset("images/imsa_logo.png", width: imageWidth),
            context: context,
            index: 2,
          ),
          _createDrawerItem(
            name: "NTT Indycar Series",
            color: const Color(0xFF0086BF),
            image: Image.asset("images/indycar_logo.png", width: imageWidth),
            context: context,
            index: 3,
          ),
          _createDrawerItem(
            name: "World Rally Champi...",
            color: const Color(0xFFFC4C02),
            image: Image.asset("images/wrc_logo.png", width: imageWidth),
            context: context,
            index: 4,
          ),
          _createDrawerItem(
            name: "Supercars",
            color: const Color(0xFF000000),
            image: Image.asset("images/supercars_logo.png", width: imageWidth),
            context: context,
            index: 5,
          ),
          _createDrawerItem(
            name: "ABB FIA Formula E",
            color: const Color(0xFF1487ED),
            image: Image.asset("images/formula_e_logo.png", width: imageWidth),
            context: context,
            index: 6,
          ),
          _createDrawerItem(
            name: "Super Formula",
            color: const Color(0xFFff00c2),
            image: Image.asset("images/super_formula_logo.png",
                height: 30, width: 50),
            context: context,
            index: 7,
          ),
          _createDrawerItem(
            name: "W Series",
            color: const Color(0xFF440099),
            image: Image.asset("images/w_series_logo.png", width: imageWidth),
            context: context,
            index: 8,
          ),
          _createDrawerItem(
            name: "GT Europe",
            color: const Color(0xFFFFFF00),
            image: Image.asset("images/gt_europe_logo.png", width: imageWidth),
            context: context,
            index: 9,
          ),
          _createDrawerItem(
            name: "WTCR",
            color: const Color(0xFF8BC63E),
            image: Image.asset("images/wtcr_logo.png", width: imageWidth),
            context: context,
            index: 10,
          ),
          _createDrawerItem(
            name: "Praga Cup UK",
            color: const Color(0x5F000000),
            image: Image.asset("images/praga_cup_logo.png", width: imageWidth),
            context: context,
            index: 11,
          ),
          _createDrawerItem(
            name: "Formula 2",
            color: const Color(0x5F000000),
            image: Image.asset("images/f2_logo.png", width: 50),
            context: context,
            index: 12,
          ),
          _createDrawerItem(
            name: "Formula 3",
            color: const Color(0x5F000000),
            image: Image.asset(
              "images/f3_logo.png",
              width: 50,
            ),
            context: context,
            index: 13,
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required String name,
    required Color color,
    required Image image,
    required BuildContext context,
    required int index,
  }) {
    return Container(
      height: 45,
      margin: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      child: ListTile(
        shape: StadiumBorder(
          side: BorderSide(
            color: color,
            width: 1,
          ),
        ),
        leading: image,
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            //overflow: TextOverflow.ellipsis,
            color: Colors.white,
            height: 0.3,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SingleSeriesCalendar(
                seriesNum: index,
              ),
            ),
          );
        },
      ),
    );
  }
}
