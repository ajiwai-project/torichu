enum Point {
  one(1),
  two(2),
  three(3),
  five(5),
  eight(8),
  thirteen(13),
  twentyOne(21),
  thirtyFour(34),
  fiftyFive(55);

  final int _value;

  const Point(this._value);

  get value => _value;

  factory Point.of(int value) {
    return Point.values.firstWhere((e) => e._value == value);
  }
}
