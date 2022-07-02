import 'package:salt/domain/api/base_api.dart';
import 'package:salt/domain/config/routes.dart';
import 'package:salt/domain/view_models/user_view_model.dart';

class UsersAPI extends BaseAPI {
  Future<List<UserViewModel>> getUsers() async {
    var result = await get<List<dynamic>>(route: Routes.users);
    return result?.map((e) => UserViewModel.fromJson(e)).toList() ?? [];
  }
}
