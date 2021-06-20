import 'package:flutter/material.dart';

class Store {
  final String id;
  final String name;
  final String imgUrl;
  final String category;
  final String hp;
  final String address;
  final int likes;

  Store(
      {@required this.id,
      @required this.name,
      @required this.imgUrl,
      @required this.category,
      @required this.hp,
      @required this.address,
      @required this.likes,
      });
}
