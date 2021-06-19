
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class User {
  final String id;
  final String pwd;
  final String hp;
  final String name;
  final String email;
  final Blob image;

  User({
    @required this.id,
    @required this.pwd,
    @required this.hp,
    @required this.name,
    @required this.email,
    @required this.image,
  });
}