// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

series_list_object _$series_list_objectFromJson(Map<String, dynamic> json) =>
    series_list_object(
      seriesList: (json['seriesList'] as List<dynamic>)
          .map((e) => Series.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$series_list_objectToJson(series_list_object instance) =>
    <String, dynamic>{
      'seriesList': instance.seriesList.map((e) => e.toJson()).toList(),
    };
