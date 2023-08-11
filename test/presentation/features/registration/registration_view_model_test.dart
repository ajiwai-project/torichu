import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/tag.dart';
import 'package:flutter_template/presentation/features/registration/registration_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/cost/cost_mather.dart';
import '../../../domain/cost/model_support.dart';
import 'registration_view_model_test.mocks.dart';

@GenerateMocks([CostRepository])
void main() {
  late RegistrationViewModel sut;
  late MockCostRepository costRepository;

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
      var tag = Tag.of('tag');
      sut.addTag(tag);

      await sut.register();

      final expectedCost = CostBuilder()
          .setTitle('title')
          .setAmount(1000)
          .setCategory(Category.food)
          .setPoint(Point.one)
          .addTag(tag)
          .build();

      verify(costRepository
              .save(argThat(matchingWithoutIdAndRegisteredAt(expectedCost))))
          .called(1);
    });
  });
}
