// Mocks generated by Mockito 5.4.0 from annotations
// in flutter_template/test/presentation/features/home/home_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_template/domain/cost/cost.dart' as _i5;
import 'package:flutter_template/domain/cost/cost_repository.dart' as _i3;
import 'package:flutter_template/domain/cost/costs.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCosts_0 extends _i1.SmartFake implements _i2.Costs {
  _FakeCosts_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CostRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCostRepository extends _i1.Mock implements _i3.CostRepository {
  MockCostRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Costs> getAll() => (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: _i4.Future<_i2.Costs>.value(_FakeCosts_0(
          this,
          Invocation.method(
            #getAll,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Costs>);
  @override
  _i4.Future<void> save(_i5.Cost? cost) => (super.noSuchMethod(
        Invocation.method(
          #save,
          [cost],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
