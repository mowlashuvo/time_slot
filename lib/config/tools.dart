import 'package:flutter/cupertino.dart';

class Tools {
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
