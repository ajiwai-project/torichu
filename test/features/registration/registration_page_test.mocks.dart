// Mocks generated by Mockito 5.4.0 from annotations
// in flutter_template/test/features/registration/registration_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_template/features/models/cost.dart' as _i4;
import 'package:flutter_template/infrastructure/repository/cost_repository.dart'
    as _i2;
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

/// A class which mocks [CostRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCostRepository extends _i1.Mock implements _i2.CostRepository {
  MockCostRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Cost>> getAll() => (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Cost>>.value(<_i4.Cost>[]),
      ) as _i3.Future<List<_i4.Cost>>);
  @override
  _i3.Future<void> save(_i4.Cost? cost) => (super.noSuchMethod(
        Invocation.method(
          #save,
          [cost],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
