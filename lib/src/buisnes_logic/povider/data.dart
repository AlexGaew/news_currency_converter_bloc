import 'package:flutter/cupertino.dart';

class TextFieldToNull extends ChangeNotifier {
  String value = '0';
  bool a = false;

  String change(String a) {
    value = a;
    notifyListeners();
    return value;
  }
  bool isNull(){
    if(value == ""){
      a = true;
      notifyListeners();
      return a;
    }
    a = false;
    notifyListeners();
    return a;
  }
}
