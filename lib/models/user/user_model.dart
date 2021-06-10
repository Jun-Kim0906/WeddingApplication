import 'package:flutter/material.dart';

class User {
  final String id;
  final String pwd;
  final String hp;
  final String name;
  final String email;

  User({
    @required this.id,
    @required this.pwd,
    @required this.hp,
    @required this.name,
    @required this.email
  });
}