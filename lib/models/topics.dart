import 'package:json_annotation/json_annotation.dart';

part 'topics.g.dart';

@JsonSerializable()
class Topic {
  String? topic;

  Topic({this.topic});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}