import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  final String SessionName;
  final String SessionStart;
  final String MainEvent;

  Session({
    required this.SessionName,
    required this.SessionStart,
    required this.MainEvent,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
