import 'package:flutter/material.dart';




class Auth with ChangeNotifier {
  var _token;
  var _expiryDate;
  var _userId;
  var _authTimer;

  bool get isAuth {
    return token != null;
  }

  get userId {
    return _userId;
  }

  get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token!;
    }
    return null;
  }

}