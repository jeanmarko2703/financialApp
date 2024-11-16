import 'package:financial/models/models.dart';
import 'package:flutter/material.dart';

import '../services/localDatabase_service.dart';

class AmountProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  AmountModel _amountModel =
      AmountModel.empty().copyWith(goalName: 'principal');
  double get currentAmount => _amountModel.currentAmount;

  void setAmount(double amount) {
    _amountModel = _amountModel.copyWith(goalAmount: amount);
    notifyListeners();
  }

  void increaseAmount(double amount) {
    _amountModel = _amountModel.copyWith(
        currentAmount: _amountModel.currentAmount + amount);
    _dbHelper.insertAmount(_amountModel);
    notifyListeners();
  }

  Future<void> loadAmount() async {
    final amount = await _dbHelper.getAmount('principal');
    if (amount != null) {
      _amountModel = amount;
      notifyListeners();
    }
  }
}
