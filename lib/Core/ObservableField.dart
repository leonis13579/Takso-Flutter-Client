class ObsrvableField<T> {
  T? _value;
  List<Function> observeMethods = [];

  T? get value => _value;
  set value(T? value) {
    _value = value;
    updated();
  }

  ObsrvableField({T? value, List<Function>? methods}) {
    if (value != null) {
      _value = value;
    }
    if (methods != null) {
      observeMethods.addAll(methods);
    }
  }

  void updated() {
    observeMethods.forEach((element) {
      element();
    });
  }
}
