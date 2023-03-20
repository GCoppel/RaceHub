// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event_Object _$Event_ObjectFromJson(Map<String, dynamic> json) => Event_Object(
      EventName: json['EventName'] as String,
      EventStart: json['EventStart'] as String,
      EventEnd: json['EventEnd'] as String,
      EventColorCode: json['EventColorCode'] as String,
      EventLogo: json['EventLogo'] as String,
      Sessions: (json['Sessions'] as List<dynamic>)
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Event_ObjectToJson(Event_Object instance) =>
    <String, dynamic>{
      'EventName': instance.EventName,
      'EventStart': instance.EventStart,
      'EventEnd': instance.EventEnd,
      'EventColorCode': instance.EventColorCode,
      'EventLogo': instance.EventLogo,
      'Sessions': instance.Sessions,
    };
