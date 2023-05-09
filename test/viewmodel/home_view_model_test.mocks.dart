// Mocks generated by Mockito 5.4.0 from annotations
// in flutter_template/test/viewmodel/home_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_template/infrastructure/model/task_entity.dart' as _i4;
import 'package:flutter_template/infrastructure/repository/task_repository.dart'
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

/// A class which mocks [TaskRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskRepository extends _i1.Mock implements _i2.TaskRepository {
  MockTaskRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.TaskEntity>> fetchAll() => (super.noSuchMethod(
        Invocation.method(
          #fetchAll,
          [],
        ),
        returnValue: _i3.Future<List<_i4.TaskEntity>>.value(<_i4.TaskEntity>[]),
      ) as _i3.Future<List<_i4.TaskEntity>>);
  @override
  _i3.Future<void> save(_i4.TaskEntity? task) => (super.noSuchMethod(
        Invocation.method(
          #save,
          [task],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
