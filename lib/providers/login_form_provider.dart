import 'package:admin_dashboard/providers/auh_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String email = '';
  String password = '';


  validateForm() {
    formKey.currentState!.validate();
  }
}
