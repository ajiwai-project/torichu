import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/tag.dart';
import 'package:flutter_template/domain/cost/tags.dart';
import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_dao_model.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/tag_dao_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final costRepositoryProvider = Provider<CostRepository>(
    (ref) => CostDBRepository(Hive.box('costBox'), Hive.box('tagBox')));

class CostDBRepository implements CostRepository {
  Box<CostDaoModel> costBox;
  Box<TagDaoModel> tagBox;

  CostDBRepository(this.costBox, this.tagBox);

  @override
  Future<void> save(Cost cost) async {
    Map<String, TagDaoModel> tagEntities = {};
    for (var tag in cost.tags.value) {
      tagEntities[tag.id] = TagDaoModel.of(tag.id, tag.value);
    }
    await tagBox.putAll(tagEntities);

    var costEntity = CostDaoModel.of(
        id: cost.id,
        title: cost.title.value,
        amount: cost.amount.value,
        point: cost.point.value,
        category: cost.category.value,
        registeredAt: cost.registeredAt.toIso8601String(),
        tagIds: cost.tags.value.map((e) => e.id).toList());
    await costBox.put(costEntity.id, costEntity);
  }

  @override
  Future<Costs> getAll() {
    var costs = costBox.values
        .map((cost) => Cost.of(
            id: cost.id,
            title: Title.of(cost.title),
            amount: Amount.of(cost.amount),
            point: Point.of(cost.point),
            category: Category.of(cost.category),
            registeredAt: DateTime.parse(cost.registeredAt),
            tags: Tags.of(tagBox.values
                .where((tag) => cost.tagIds.contains(tag.id))
                .map((tag) => Tag.of(tag.id, tag.value))
                .toList())))
        .toList();

    return Future.value(Costs(values: costs));
  }

  @override
  Future<void> remove(String id) async {
    var tagIds = costBox.values.where((e) => e.id == id).first.tagIds;
    await tagBox.deleteAll(tagIds);

    await costBox.delete(id);
  }
}
