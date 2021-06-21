import 'package:flutter/material.dart';

class Review {
  final String sID;
  final String uID;
  final DateTime time;
  final String content;
  final double rating;

  Review({
    @required this.sID,
    @required this.uID,
    @required this.time,
    @required this.content,
    @required this.rating,
  });
}
