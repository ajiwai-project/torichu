import 'package:flutter_template/features/home/home_view_model.dart';
import 'package:flutter_template/features/models/category.dart';
import 'package:flutter_template/features/models/cost.dart';
import 'package:flutter_template/features/models/point.dart';
import 'package:flutter_template/infrastructure/repository/cost_repository.dart';
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
      const cost = Cost(
        title: 'title',
        amount: 100,
        point: Point.one,
        category: Category.food,
      );
      when(costRepository.getAll()).thenAnswer((_) async => [cost]);

      await sut.load();

      verify(costRepository.getAll()).called(1);
      expect(sut.debugState.value!.costs, [cost]);
    });
  });
}
