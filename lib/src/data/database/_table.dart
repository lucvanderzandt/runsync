class Table<T> {
  Map<String, T> _data = {};

  void put(String key, T value) {
    _data[key] = value;
  }

  T? get(String key) => _data[key];

  List<T> getAll() => _data.values.toList();

  T? getWhere(bool Function(T) test, {T Function()?  orElse}) =>
      _data.values.firstWhere(test, orElse: orElse);

  T? get first => _data.values.first;

  List<T?> getAllStartingWith(String key) {
    final keys =
        _data.keys.where((element) => element.startsWith(key)).toList();
    final values = <T?>[];
    for (final k in keys) {
      values.add(_data[k]);
    }
    return values;
  }

  void delete(String key) {
    _data.remove(key);
  }

  void truncate() {
    _data = {};
  }
}
