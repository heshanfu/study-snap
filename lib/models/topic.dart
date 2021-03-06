import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable()
class Topic {

  String title;
  String description;
  List<int> indexes;

  Topic({this.title, this.description, this.indexes});

  void addIndex(int index) {
    indexes.add(index);
    indexes.sort();
  }

  void removeIndex(int index) {
    indexes.remove(index);
  }

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);

}