import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/size.dart';
import 'package:flutter_template/presentation/features/registration/registration_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:clock/clock.dart';
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
      final dummyDateTime = DateTime(2021, 9, 1);
      withClock(Clock.fixed(dummyDateTime), () async {
        sut.setTitle('title');
        sut.setPrice(1000);
        sut.setPoint(Point.one);
        sut.setSize(Size.small);

        await sut.register();

        final expectedCost = CostBuilder()
            .setTitle('title')
            .setAmount(1000)
            .setPoint(Point.one)
            .setSize(Size.small)
            .setRegisteredAt(dummyDateTime)
            .build();

        verify(costRepository.save(argThat(matchingWithoutId(expectedCost))))
            .called(1);
      });
    });
  });
}
