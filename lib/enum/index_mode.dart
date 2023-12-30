import 'package:flutter/material.dart';

enum IndexMode {
  list('投稿リスト', Icon(Icons.list)),
  profile('プロフィール', Icon(Icons.account_circle));

  const IndexMode(this.label, this.icon);

  final String label;
  final Icon icon;
}
