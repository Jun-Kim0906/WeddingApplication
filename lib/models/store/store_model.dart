import 'package:flutter/material.dart';

class Store {
  final String id;
  final String name;
  final String imgUrl;
  final String category;
  final String hp;
  final String address;
  final int likes;

  Store({
    @required this.id,
    @required this.name,
    @required this.imgUrl,
    @required this.category,
    @required this.hp,
    @required this.address,
    @required this.likes,
  });

  Store update(
      {String id,
      String name,
      String imgUrl,
      String category,
      String hp,
      String address,
      int likes}) {
    return Store(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      category: category ?? this.category,
      hp: hp ?? this.hp,
      address: address ?? this.address,
      likes: likes ?? this.likes,
    );
  }
}
