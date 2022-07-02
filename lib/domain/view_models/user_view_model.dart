import 'package:json_annotation/json_annotation.dart';

part 'user_view_model.g.dart';

@JsonSerializable()
class UserViewModel {
  final int albumId;
  final int userId;
  final String name;
  final String url;
  final String thumbnailUrl;

  UserViewModel({
    required this.albumId,
    required this.userId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
  });

  factory UserViewModel.fromJson(Map<String, dynamic> json) =>
      _$UserViewModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserViewModelToJson(this);
}
