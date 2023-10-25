import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/point.dart';
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
      sut.setPoint(Point.one);
      sut.setRegisteredAt(DateTime(2023, 8, 1));

      await sut.register();

      final expectedCost = CostBuilder()
          .setTitle('title')
          .setAmount(1000)
          .setPoint(Point.one)
          .setRegisteredAt(DateTime(2023, 8, 1))
          .build();

      verify(costRepository.save(argThat(matchingWithoutId(expectedCost))))
          .called(1);
    });
    test('should save cost without registerAt', () async {
      sut.setTitle('title');
      sut.setPrice(1000);
      sut.setPoint(Point.one);

      await sut.register();

      final expectedCost = CostBuilder()
          .setTitle('title')
          .setAmount(1000)
          .setPoint(Point.one)
          .build();

      verify(costRepository
              .save(argThat(matchingWithoutIdAndRegisteredAt(expectedCost))))
          .called(1);
    });
  });
}
