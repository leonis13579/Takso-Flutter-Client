class ObsrvableField<T> {
  T? _value;
  List<Function> observeMethods = [];

  T? get value => _value;
  set value(T? value) {
    _value = value;
    observeMethods.forEach((element) {
      element();
    });
  }

  ObsrvableField({T? value, List<Function>? methods}) {
    if (value != null) {
      _value = value;
    }
    if (methods != null) {
      observeMethods.addAll(methods);
    }
  }
}
