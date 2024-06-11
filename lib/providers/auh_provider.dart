import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO: Peticion HTTP
    this._token = 'lasjdlaksjdlkasjdlkajsdlkajsldk.dakljdaklsd.asdlkasjda';
    LocalStorage.prefs.setString('token', this._token!);
    // authStatus = AuthStatus.authenticated;
    // notifyListeners();
    isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: ir al backend y comprobar si el JWT es valido

    await Future.delayed(Duration(milliseconds: 2000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
