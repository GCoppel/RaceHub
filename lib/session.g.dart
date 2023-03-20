// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      SessionName: json['SessionName'] as String,
      SessionStart: json['SessionStart'] as String,
      MainEvent: json['MainEvent'] as String,
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'SessionName': instance.SessionName,
      'SessionStart': instance.SessionStart,
      'MainEvent': instance.MainEvent,
    };
