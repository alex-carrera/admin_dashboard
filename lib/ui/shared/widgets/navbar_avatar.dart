import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network('https://cdn0.iconfinder.com/data/icons/avatar-vol2/63/65-512.png'),
        width: 30,
        height: 30,
      ),
    );
  }
}