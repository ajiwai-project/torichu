enum Size {
  small(1),
  medium(2),
  large(3);

  final int _value;

  const Size(this._value);

  int get value => _value;

  factory Size.of(int value) {
    return Size.values.firstWhere((element) => element._value == value);
  }
}
