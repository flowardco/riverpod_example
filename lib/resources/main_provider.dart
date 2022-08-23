import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salt/domain/api/posts_api.dart';
import 'package:salt/domain/api/users_api.dart';
import 'package:salt/domain/view_models/home_view_model.dart';
import 'package:salt/domain/view_models/post_view_model.dart';
import 'package:salt/domain/view_models/user_view_model.dart';

class MainProvider extends StateNotifier<List<HomeViewModel>> {
  MainProvider() : super([]);

  List<PostViewModel>? _listPosts;
  List<UserViewModel>? _listUsers;

  Future<void> init() async {
    await Future.wait([_getUsers(), _getPosts()]);
    _mergeData();
  }

  Future<void> _getPosts() async {
    _listPosts = await PostsAPI().getPosts();
  }

  Future<void> _getUsers() async {
    _listUsers = await UsersAPI().getUsers();
  }

  void _mergeData() {
    _listUsers?.forEach(
      (user) {
        var posts =
            _listPosts?.where((post) => post.userId == user.userId).toList() ??
                [];
        state.add(
          HomeViewModel(
            url: user.url,
            name: user.name,
            albumId: user.albumId,
            thumbnailUrl: user.thumbnailUrl,
            userId: user.userId,
            postViewModels: posts,
          ),
        );
      },
    );
  }
}
