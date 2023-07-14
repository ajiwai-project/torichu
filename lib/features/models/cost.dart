class Cost {
  static const _maxTitleLength = 100;
  static const _maxAmount = 9999999;
  static const _pointPattern = {1, 2, 3, 5, 8, 13, 21, 34, 55};
  static const _categoryPattern = {
    '食費',
    '趣味・娯楽',
    '交際費',
    '衣服・美容',
    '健康・医療',
    '教養・教育',
    '水道・光熱費',
    '住宅',
    '保険,通信費'
  };

  late String _title;
  late int _amount;
  late int _point;
  late String _category;

  Cost(
      {required String title,
      required int amount,
      required int point,
      required String category}) {
    if (title.length > _maxTitleLength) {
      throw Exception('Title must be 100 characters or less.');
    }

    if (amount > _maxAmount) {
      throw Exception('Amount must be less than 9999999');
    }

    if (!_pointPattern.contains(point)) {
      throw Exception('Point must be Fibonacci number below 55');
    }

    if (!_categoryPattern.contains(category)) {
      throw Exception('Category must be in $_categoryPattern');
    }

    _title = title;
    _amount = amount;
    _point = point;
    _category = category;
  }

  String get title => _title;
  int get amount => _amount;
  int get point => _point;
  String get category => _category;
}
