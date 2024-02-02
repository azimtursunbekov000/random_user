import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:tab_bar/features/data/models/user_model.dart';
import 'package:tab_bar/features/domain/repositories/user_repository.dart';
import 'package:tab_bar/internal/helpers/api_requester.dart';
import 'package:tab_bar/internal/helpers/catch_excertion.dart';

class UserRepositoryImpl implements UserRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<UserModel> getUserDetailInfo() async {
    try {
      Response response = await apiRequester.toGet(apiRequester.url);

      log('getUserDetailInfo result == ${response.data}');

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
      throw response;
    } catch (e) {
      log("impl=============== $e");

      throw CatchException.convertException(e);
    }
  }
}
