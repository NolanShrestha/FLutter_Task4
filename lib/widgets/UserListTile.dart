import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task4/models/users.dart';

class UserListTile extends StatelessWidget {
  final User user;
  final VoidCallback onTap;
  final Widget? trailing;

  const UserListTile({
    Key? key,
    required this.user,
    required this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        child: Text(user.name[0]),
      ),
      trailing: trailing,
    );
  }
}
