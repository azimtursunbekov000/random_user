import 'package:tab_bar/features/data/models/user_model.dart';
import 'package:tab_bar/features/domain/repositories/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<UserModel> getUserDetailInfo() async {
    return await userRepository.getUserDetailInfo();
  }
}
