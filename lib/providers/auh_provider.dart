import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {

  String? _token;

  login(String email, String password){
    //TODO: Peticion HTTP
    this._token = 'lasjdlaksjdlkasjdlkajsdlkajsldk.dakljdaklsd.asdlkasjda';
    print('almacenar JWT: $_token');

    //TODO: Navegar al dashboard

    notifyListeners();
  }

}