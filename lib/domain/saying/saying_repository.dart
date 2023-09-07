import 'package:flutter_template/domain/saying/saying.dart';

abstract class SayingRepository {
  Future<Saying> choice();
}
