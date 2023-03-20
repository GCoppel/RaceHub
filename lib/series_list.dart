
import 'package:RaceHub/series.dart';
import 'package:json_annotation/json_annotation.dart';

part 'series_list.g.dart';

@JsonSerializable(explicitToJson: true)
class series_list_object{
  final List<Series> seriesList;

  series_list_object({required this.seriesList});

  factory series_list_object.fromJson(Map<String, dynamic> json) => _$series_list_objectFromJson(json);

  Map<String, dynamic> toJson() => _$series_list_objectToJson(this);
}