import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themetext {
  static final headline = _headline.copyWith(fontSize: 32);

  static final subhead = _subHead.copyWith(fontSize: 16);

  static const _headline = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  static const _subHead = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
}
