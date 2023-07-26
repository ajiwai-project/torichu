import 'package:flutter/material.dart';

enum Category {
  food('食費', Colors.red),
  hobbies('趣味・娯楽', Colors.pink),
  entertainment('交際費', Colors.blueGrey),
  clothingAndBeauty('衣服・美容', Colors.yellow),
  healthAndMedicalCare('健康・医療', Colors.orange),
  education('教養・教育', Colors.blue),
  utility('水道・光熱費', Colors.cyan),
  housing('住宅', Colors.green),
  insurance('保険', Colors.pinkAccent),
  network('通信費', Colors.purple);

  final String _value;
  final Color _color;

  const Category(this._value, this._color);

  get value => _value;
  get color => _color;

  factory Category.of(String value) {
    return Category.values.firstWhere((e) => e._value == value);
  }
}
