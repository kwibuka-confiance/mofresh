import 'package:flutter/cupertino.dart';

class UI with ChangeNotifier {
  int step = 0;

  void next() {
    step = step + 1;
    notifyListeners();
  }

  void previous() {
    step = step - 1;
    notifyListeners();
  }
}
