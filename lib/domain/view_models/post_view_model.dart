import 'package:json_annotation/json_annotation.dart';

part 'post_view_model.g.dart';

@JsonSerializable()
class PostViewModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostViewModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostViewModel.fromJson(Map<String, dynamic> json) =>
      _$PostViewModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostViewModelToJson(this);
}
