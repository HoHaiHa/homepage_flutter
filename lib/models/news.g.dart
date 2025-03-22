// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
  imagePath: json['imagePath'] as String,
  topic: json['topic'] as String,
  title: json['title'] as String,
  brandImagePath: json['brandImagePath'] as String,
  brandName: json['brandName'] as String,
  timePost: DateTime.parse(json['timePost'] as String),
);

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
  'imagePath': instance.imagePath,
  'topic': instance.topic,
  'title': instance.title,
  'brandImagePath': instance.brandImagePath,
  'brandName': instance.brandName,
  'timePost': instance.timePost.toIso8601String(),
};
