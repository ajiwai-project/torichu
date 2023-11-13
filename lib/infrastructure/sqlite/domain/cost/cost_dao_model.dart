import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_template/domain/cost/size.dart';

import '../../database.dart';

class CostDao extends SqliteDao<CostDaoModel> {
  CostDao() : super(CostDaoModel.tableName, CostDaoModel.fromJson);
}

class CostDaoModel implements SqliteEntity {
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

  @override
  factory CostDaoModel.fromJson(Map<String, dynamic> json) {
    return CostDaoModel(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      size: json['size'],
      registeredAt: DateTime.parse(json['registeredAt']).toLocal(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'size': size,
      'registeredAt': registeredAt.toUtc().toIso8601String(),
    };
  }
}
