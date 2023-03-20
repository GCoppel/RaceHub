// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
      SeriesNum: json['SeriesNum'] as int,
      Events: (json['Events'] as List<dynamic>)
          .map((e) => Event_Object.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'SeriesNum': instance.SeriesNum,
      'Events': instance.Events.map((e) => e.toJson()).toList(),
    };
