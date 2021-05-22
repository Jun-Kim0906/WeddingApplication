import 'package:flutter/material.dart';

class User {
  final String id;
  final String pwd;
  final String hp;
  final String name;

  User({
    @required this.id,
    @required this.pwd,
    @required this.hp,
    @required this.name,
  });
}