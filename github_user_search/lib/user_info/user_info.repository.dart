import 'package:dio/dio.dart';
import 'package:github_user_search/user_info/user_info.model.dart';

class UserInfoRepository {
  final Dio provider;

  UserInfoRepository({
    required this.provider,
  });

  Future<UserInfoModel> fetchUserInfoByLogin(String login) async {
    try {
      final response =
          await provider.get('https://api.github.com/users/$login');

      return UserInfoModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Erro ao buscar usuário');
    }
  }
}
