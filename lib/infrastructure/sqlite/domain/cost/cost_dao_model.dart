import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_template/domain/cost/size.dart';

class CostDaoModel {
  static const tableName = 'costs';
  final String id;
  String title;
  int amount;
  DateTime registeredAt;
  int size;

  CostDaoModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.size,
    required this.registeredAt,
  });

  factory CostDaoModel.fromEntity(Cost cost) {
    return CostDaoModel(
      id: cost.id,
      title: cost.title.value,
      amount: cost.amount.value,
      size: cost.size.value,
      registeredAt: cost.registeredAt,
    );
  }

  Cost toEntity() {
    return Cost.of(
      id: id,
      title: Title.of(title),
      amount: Amount.of(amount),
      size: Size.of(size),
      registeredAt: registeredAt,
    );
  }

  factory CostDaoModel.fromMap(Map<String, dynamic> map) {
    return CostDaoModel(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      size: map['size'],
      registeredAt: DateTime.parse(map['registeredAt']).toLocal(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'size': size,
      'registeredAt': registeredAt.toUtc().toIso8601String(),
    };
  }
}
