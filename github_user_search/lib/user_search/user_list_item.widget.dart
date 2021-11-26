import 'package:flutter/material.dart';
import 'package:github_user_search/user_info/user_info.page.dart';
import 'package:github_user_search/user_search/github_user.model.dart';

class UserListItem extends StatelessWidget {
  GithubUserModel model;

  UserListItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  onItemPressed(BuildContext context) {
    Navigator.of(context).pushNamed(
      UserInfoPage.route,
      arguments: UserInfoPageArgs(model: model),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () => onItemPressed(context),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(model.avatarUrl),
            ),
            const SizedBox(width: 8),
            Text(
              model.login,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}
