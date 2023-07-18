import 'package:flutter_template/features/models/category.dart';
import 'package:flutter_template/features/models/cost.dart';
import 'package:flutter_template/features/models/point.dart';
import 'package:flutter_template/features/registration/registration_view_model.dart';
import 'package:flutter_template/infrastructure/repository/cost_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'registration_view_model_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late RegistrationViewModel sut;
  late CostRepository costRepository;

  setUp(() {
    costRepository = MockCostRepository();
    sut = RegistrationViewModel(costRepository);
  });

  group('Register', () {
    test('should save cost', () async {
      sut.setTitle('title');
      sut.setPrice(1000);
      sut.setCategory(Category.food);
      sut.setPoint(Point.one);

      await sut.register();

      var cost = const Cost(
          title: 'title',
          category: Category.food,
          point: Point.one,
          amount: 1000);
      verify(costRepository.save(cost)).called(1);
    });
  });
}
