import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:email_validator/email_validator.dart';
import 'package:admin_dashboard/providers/auh_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);
        return Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: Form(
                  autovalidateMode: AutovalidateMode
                      .always, //hace que el formulario se valide apenas se inscribe
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                      //email
                      TextFormField(
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? ''))
                            return 'Email no valido';

                          return null;
                        },
                        onChanged: (value) => loginFormProvider.email = value,
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration(
                            hint: 'Ingrese su correo',
                            label: 'Email',
                            icon: Icons.email_outlined),
                      ),

                      SizedBox(height: 20),

                      //Password
                      TextFormField(
                        onChanged: (value) =>
                            loginFormProvider.password = value,
                        validator: (value) {
                          if (value == null) return 'Ingrese su contraseña';
                          if (value.length < 6)
                            return 'La contraseña debe tener mas de 6 digitos';
                          return null;
                        },
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration(
                            hint: '******',
                            label: 'Contraseña',
                            icon: Icons.lock_outline_rounded),
                      ),

                      SizedBox(height: 20),
                      CustomOutlinedButton(
                        onPressed: () {
                          final isValid = loginFormProvider.validateForm();
                          if (isValid)
                            authProvider.login(loginFormProvider.email, loginFormProvider.password);
                        },
                        text: 'Ingresar',
                      ),

                      SizedBox(height: 20),
                      LinkText(
                        text: 'Nueva cuenta',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Flurorouter.registerRoute);
                        },
                      )
                    ],
                  )),
            ),
          ),
        );
      }),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey));
  }
}
