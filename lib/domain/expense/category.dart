enum Category {
  food('食費'),
  hobby('趣味'),
  entertainment('交際費'),
  clothing('衣服'),
  health('健康'),
  education('教育'),
  utilities('光熱費'),
  housing('住宅'),
  ensuarance('保険'),
  communication('通信費');

  final String name;

  const Category(this.name);

  factory Category.of(String name) {
    return Category.values.firstWhere((e) => e.name == name);
  }
}
