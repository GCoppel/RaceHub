import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage extends StatelessWidget {
  static const keyDarkMode = 'key-DarkMode';
  static const keyShowPastEvents = 'key-ShowPastEvents';

  static const List<String> titles = [
    "Formula 1",
    "WEC",
    "IMSA",
    "Indycar",
    "WRC",
    "Supercars",
    "Formula E",
    "Super Formula",
    "W Series",
    "GT Europe",
    "WTCR",
    "Praga Cup UK",
    "Formula 2",
    "Formula 3",
  ];

  static const List<String> keyShowOnHomepage = [
    'key-ShowOnHomepageF1',
    'key-ShowOnHomepageWEC',
    'key-ShowOnHomepageIMSA',
    'key-ShowOnHomepageIndycar',
    'key-ShowOnHomepageWRC',
    'key-ShowOnHomepageSupercars',
    'key-ShowOnHomepageFormulaE',
    'key-ShowOnHomepageSuperFormula',
    'key-ShowOnHomepageWSeries',
    'key-ShowOnHomepageGTEurope',
    'key-ShowOnHomepageWTCR',
    'key-ShowOnHomepagePraga',
    'key-ShowOnHomepageF2',
    'key-ShowOnHomepageF3',
  ];

  static const List<String> keyPracticeNotify = [
    'key-PracticeNotifyF1',
    'key-PracticeNotifyWEC',
    'key-PracticeNotifyIMSA',
    'key-PracticeNotifyIndycar',
    'key-PracticeNotifyWRC',
    'key-PracticeNotifySupercars',
    'key-PracticeNotifyFormulaE',
    'key-PracticeNotifySuperFormula',
    'key-PracticeNotifyWSeries',
    'key-PracticeNotifyGTEurope',
    'key-PracticeNotifyWTCR',
    'key-PracticeNotifyPraga',
    'key-PracticeNotifyF2',
    'key-PracticeNotifyF3',
  ];

  static const List<String> keyQualifyingNotify = [
    'key-QualifyingNotifyF1',
    'key-QualifyingNotifyWEC',
    'key-QualifyingNotifyIMSA',
    'key-QualifyingNotifyIndycar',
    'key-QualifyingNotifyWRC',
    'key-QualifyingNotifySupercars',
    'key-QualifyingNotifyFormulaE',
    'key-QualifyingNotifySuperFormula',
    'key-QualifyingNotifyWSeries',
    'key-QualifyingNotifyGTEurope',
    'key-QualifyingNotifyWTCR',
    'key-QualifyingNotifyPraga',
    'key-QualifyingNotifyF2',
    'key-QualifyingNotifyF3',
  ];

  static const List<String> keyRaceNotify = [
    'key-RaceNotifyF1',
    'key-RaceNotifyWEC',
    'key-RaceNotifyIMSA',
    'key-RaceNotifyIndycar',
    'key-RaceNotifyWRC',
    'key-RaceNotifySupercars',
    'key-RaceNotifyFormulaE',
    'key-RaceNotifySuperFormula',
    'key-RaceNotifyWSeries',
    'key-RaceNotifyGTEurope',
    'key-RaceNotifyWTCR',
    'key-RaceNotifyPraga',
    'key-RaceNotifyF2',
    'key-RaceNotifyF3',
  ];

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> generator = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Settings",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 75, 94, 112),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: "App Settings",
              children: <Widget>[
                buildDarkMode(),
                buildShowPastEvents(),
              ],
            ),
            SettingsGroup(
              title: "Series and Notification Settings",
              children: <Widget>[
                for (var i in generator) buildSeriesExpansionPanels(i),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDarkMode() {
    return SwitchSettingsTile(
      title: "Use Dark Mode",
      settingKey: keyDarkMode,
      onChange: (_) {},
    );
  }

  Widget buildShowPastEvents() {
    return SwitchSettingsTile(
      title: "Show Past Events",
      settingKey: keyShowPastEvents,
      onChange: (_) {},
    );
  }

  Widget buildSeriesExpansionPanels(int index) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        ExpandableSettingsTile(
          title: titles[index],
          expanded: false,
          enabled: true,
          children: <Widget>[
            SwitchSettingsTile(
                title: "Show on Homepage",
                settingKey: keyShowOnHomepage[index]),
            SwitchSettingsTile(
                title: "Practice Sessions",
                settingKey: keyPracticeNotify[index]),
            SwitchSettingsTile(
                title: "Qualifying Sessions",
                settingKey: keyQualifyingNotify[index]),
            SwitchSettingsTile(
                title: "Race Sessions", settingKey: keyRaceNotify[index]),
          ],
        ),
      ],
    );
  }
}
