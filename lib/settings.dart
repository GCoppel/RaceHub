
import 'package:RaceHub/notificationSettings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings.g.dart';

@JsonSerializable(explicitToJson: true)
class Settings {
  bool showPastEvents;
  bool darkMode;
  List<bool> showOnHomepage; //00 - 13
  List<NotificationSettings> notifications; //00_1 - 13_3

  Settings({
    required this.showPastEvents,
    required this.darkMode,
    required this.showOnHomepage,
    required this.notifications,
  });

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
