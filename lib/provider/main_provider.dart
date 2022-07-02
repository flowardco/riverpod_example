import 'package:flutter/foundation.dart';
import 'package:salt/domain/api/posts_api.dart';
import 'package:salt/domain/api/users_api.dart';
import 'package:salt/domain/view_models/home_view_model.dart';
import 'package:salt/domain/view_models/post_view_model.dart';
import 'package:salt/domain/view_models/user_view_model.dart';

class MainProvider extends ChangeNotifier {
  List<PostViewModel>? _listPosts;
  List<UserViewModel>? _listUsers;
  final List<HomeViewModel> _homeItems = [];

  List<HomeViewModel> get homeItems => _homeItems;

  Future<void> init() async {
    await _getPosts();
    await _getUsers();
    _mergeData();
    notifyListeners();
  }

  Future<void> _getPosts() async {
    _listPosts = await PostsAPI().getPosts();
  }

  Future<void> _getUsers() async {
    _listUsers = await UsersAPI().getUsers();
  }

  void _mergeData() {
    _listUsers?.forEach((user) {
      var posts =
          _listPosts?.where((post) => post.userId == user.userId).toList() ??
              [];
      _homeItems.add(
        HomeViewModel(
          url: user.url,
          name: user.name,
          albumId: user.albumId,
          thumbnailUrl: user.thumbnailUrl,
          userId: user.userId,
          postViewModels: posts,
        ),
      );
    });
  }
}
