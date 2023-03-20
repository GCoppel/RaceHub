import 'package:json_annotation/json_annotation.dart';
import 'package:RaceHub/event.dart';

part 'series.g.dart';

@JsonSerializable(explicitToJson: true)
class Series {
  final int SeriesNum;
  final List<Event_Object> Events;

  Series({required this.SeriesNum, required this.Events});

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesToJson(this);
}
