import 'package:flutter/material.dart';
import 'package:flutter_template/domain/cost/category.dart';

class CategoryIcon extends StatelessWidget {
  final Category category;

  const CategoryIcon({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(category.value);
  }
}
