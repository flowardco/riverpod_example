// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserViewModel _$UserViewModelFromJson(Map<String, dynamic> json) =>
    UserViewModel(
      albumId: json['albumId'] as int,
      userId: json['userId'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$UserViewModelToJson(UserViewModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'userId': instance.userId,
      'name': instance.name,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
