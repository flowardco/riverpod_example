import 'package:salt/domain/api/base_api.dart';
import 'package:salt/domain/config/routes.dart';
import 'package:salt/domain/view_models/post_view_model.dart';

class PostsAPI extends BaseAPI {
  Future<List<PostViewModel>> getPosts() async {
    var result = await get<List<PostViewModel>>(route: Routes.posts);
    return result ?? [];
  }
}
