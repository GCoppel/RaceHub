import 'package:json_annotation/json_annotation.dart';
import 'package:RaceHub/session.dart';

part 'event.g.dart';

@JsonSerializable()
class Event_Object {
  final String EventName;
  final String EventStart;
  final String EventEnd;
  final String EventColorCode;
  final String EventLogo;
  final List<Session> Sessions;

  Event_Object({
    required this.EventName,
    required this.EventStart,
    required this.EventEnd,
    required this.EventColorCode,
    required this.EventLogo,
    required this.Sessions,
  });

  factory Event_Object.fromJson(Map<String, dynamic> json) =>
      _$Event_ObjectFromJson(json);

  Map<String, dynamic> toJson() => _$Event_ObjectToJson(this);
}
