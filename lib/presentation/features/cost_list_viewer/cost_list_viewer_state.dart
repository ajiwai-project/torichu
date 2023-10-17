import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/saying/saying.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cost_list_viewer_state.freezed.dart';

@freezed
class CostListViewerState with _$CostListViewerState {
  const factory CostListViewerState(
          {@Default(Costs(values: [])) Costs costs,
          @Default(Saying(value: '', author: '')) Saying saying}) =
      _CostListViewerState;
}
