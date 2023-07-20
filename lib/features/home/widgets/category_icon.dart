import 'package:flutter/material.dart';
import 'package:flutter_template/features/models/category.dart';

class CategoryIcon extends StatelessWidget {
  final Category category;

  const CategoryIcon({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(category.value);
  }
}
