import 'package:tab_bar/features/data/models/user_model.dart';

abstract class UserRepository {
  ///RU: получение детальную информацию пользователей
  ///
  ///EN: get by detail user info

  Future<UserModel> getUserDetailInfo();
}
