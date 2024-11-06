import 'package:flutter/material.dart';

class MenuNavigatorModel with ChangeNotifier {

  bool _show = true;

  bool get mostrar => _show;

  set show(bool valor) {
    _show = valor;
    notifyListeners();
  }
}