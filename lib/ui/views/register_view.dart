import 'package:admin_dashboard/providers/regirter_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);
        return Container(
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 370),
            child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 1)
                          return 'El campo no puede estar vacio';
                        return null;
                      },
                      onChanged: (value) => registerFormProvider.nombre = value,
                      style: TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.person),
                    ),

                    SizedBox(height: 20),
                    //email
                    TextFormField(
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? ''))
                          return 'Email no valido';

                        return null;
                      },
                      onChanged: (value) => registerFormProvider.email = value,
                      style: TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined),
                    ),

                    SizedBox(height: 20),

                    //Password
                    TextFormField(
                      onChanged: (value) => registerFormProvider.password = value,
                      validator: (value) {
                        if (value == null) return 'Ingrese su contraseña';
                        if (value.length < 6)
                          return 'La contraseña debe tener mas de 6 digitos';
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                          hint: '******',
                          label: 'Contraseña',
                          icon: Icons.lock_outline_rounded),
                    ),

                    SizedBox(height: 20),
                    CustomOutlinedButton(
                      onPressed: () {
                        registerFormProvider.validateForm();
                      },
                      text: 'Crear cuenta',
                    ),

                    SizedBox(height: 20),
                    LinkText(
                      text: 'Ir al login',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.loginRoute);
                      },
                    )
                  ],
                )),
          )),
        );
      }),
    );
  }
}
