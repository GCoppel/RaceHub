// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificationSettings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationSettings _$NotificationSettingsFromJson(
        Map<String, dynamic> json) =>
    NotificationSettings(
      SeriesNum: json['SeriesNum'] as int,
      Practice: json['Practice'] as bool,
      Qualifying: json['Qualifying'] as bool,
      Race: json['Race'] as bool,
    );

Map<String, dynamic> _$NotificationSettingsToJson(
        NotificationSettings instance) =>
    <String, dynamic>{
      'SeriesNum': instance.SeriesNum,
      'Practice': instance.Practice,
      'Qualifying': instance.Qualifying,
      'Race': instance.Race,
    };
