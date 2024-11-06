import 'package:flutter/material.dart';

class TipsProvider with ChangeNotifier {
  // Variables
  double _amount = 0.0;
  double _selectedTipPercentage = 0.0;
  double _totalAmount = 0.0;

  // Lista de porcentajes disponibles
  final List<double> availableTipPercentages = [5, 10, 15, 20];

  // Getters
  double get amount => _amount;
  double get selectedTipPercentage => _selectedTipPercentage;
  double get totalAmount => _totalAmount;

  // Setters
  set setAmount(double value) {
    _amount = _validateAmount(value);
    _calculateTotal();
    notifyListeners();
  }

  // Método de selección de propina
  void selectTipPercentage(double percentage) {
    if (availableTipPercentages.contains(percentage)) {
      _selectedTipPercentage = percentage;
      _calculateTotal();
      notifyListeners();
    }
  }

  // Validación si es número válido
  double _validateAmount(double value) {
    return value >= 0 ? value : 0.0;
  }

  // Cálculo del total a pagar con propina
  void _calculateTotal() {
    double tipAmount = (_amount * _selectedTipPercentage) / 100;
    _totalAmount = tipAmount;
  }


}
