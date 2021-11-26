import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_user_search/user_info/user_info.model.dart';
import 'package:github_user_search/user_info/user_info.repository.dart';
import 'package:github_user_search/user_search/github_user.model.dart';

class UserInfoPageArgs {
  final GithubUserModel model;

  UserInfoPageArgs({required this.model});
}

class UserInfoPage extends StatefulWidget {
  static String route = 'user_info';

  UserInfoPageArgs args;

  UserInfoPage({Key? key, required this.args}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final UserInfoRepository repository = UserInfoRepository(provider: Dio());

  UserInfoModel? model;

  @override
  void initState() {
    super.initState();

    repository
        .fetchUserInfoByLogin(widget.args.model.login)
        .then((value) => setState(
              () {
                model = value;
              },
            ));
  }

  Widget buildItem(String title, int quantity) => Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: model != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    CircleAvatar(
                      maxRadius: 80,
                      backgroundImage: NetworkImage(model!.avatarUrl),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      model!.login,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildItem('Followers', model!.followers),
                        buildItem('Following', model!.following),
                        buildItem('Repos', model!.repos),
                      ],
                    )
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
