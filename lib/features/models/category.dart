enum Category {
  food('食費'),
  hobbies('趣味・娯楽'),
  entertainment('交際費'),
  clothingAndBeauty('衣服・美容'),
  healthAndMedicalCare('健康・医療'),
  education('教養・教育'),
  utility('水道・光熱費'),
  housing('住宅'),
  insurance('保険'),
  network('通信費');

  final String _value;

  const Category(this._value);

  get value => _value;

  factory Category.of(String value) {
    return Category.values.firstWhere((e) => e._value == value);
  }
}
