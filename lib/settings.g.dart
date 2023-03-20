// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      showPastEvents: json['showPastEvents'] as bool,
      darkMode: json['darkMode'] as bool,
      showOnHomepage: (json['showOnHomepage'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationSettings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'showPastEvents': instance.showPastEvents,
      'darkMode': instance.darkMode,
      'showOnHomepage': instance.showOnHomepage,
      'notifications': instance.notifications.map((e) => e.toJson()).toList(),
    };
