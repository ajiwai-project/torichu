import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/presentation/features/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late HomeViewModel sut;
  late CostRepository costRepository;

  setUp(() {
    costRepository = MockCostRepository();
    sut = HomeViewModel(costRepository);
  });

  group('HomeViewModel', () {
    test('should be initialized', () async {
      final cost = Cost.of(
        id: 'id1',
        title: 'title',
        amount: 100,
        point: Point.one,
        category: Category.food,
      );
      when(costRepository.getAll())
          .thenAnswer((_) async => Costs(values: [cost]));

      await sut.load();

      verify(costRepository.getAll()).called(1);
      expect(sut.debugState.value!.costs, Costs(values: [cost]));
    });

    test('Remove cost', () async {
      const costId = 'id1';
      when(costRepository.getAll())
          .thenAnswer((_) async => const Costs(values: []));

      await sut.remove(costId);

      verify(costRepository.remove(costId)).called(1);
      verify(costRepository.getAll()).called(1);
    });
  });
}
