import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_template/domain/cost/size.dart';

class CostBuilder {
  String id = 'dummy';
  String title = 'dummy';
  int amount = 0;
  Size size = Size.medium;
  DateTime registeredAt = DateTime(1900);

  CostBuilder setId(String id) {
    this.id = id;
    return this;
  }

  CostBuilder setTitle(String title) {
    this.title = title;
    return this;
  }

  CostBuilder setAmount(int amount) {
    this.amount = amount;
    return this;
  }

  CostBuilder setSize(Size size) {
    this.size = size;
    return this;
  }

  CostBuilder setRegisteredAt(DateTime registeredAt) {
    this.registeredAt = registeredAt;
    return this;
  }

  Cost build() {
    return Cost.of(
      id: id,
      title: Title.of(title),
      amount: Amount.of(amount),
      size: size,
      registeredAt: registeredAt,
    );
  }
}
