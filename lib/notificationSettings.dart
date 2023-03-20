
import 'package:json_annotation/json_annotation.dart';

part 'notificationSettings.g.dart';

@JsonSerializable()
class NotificationSettings {
  int SeriesNum;
  bool Practice;
  bool Qualifying;
  bool Race;

  NotificationSettings({
    required this.SeriesNum,
    required this.Practice,
    required this.Qualifying,
    required this.Race,
  });

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationSettingsToJson(this);
}
