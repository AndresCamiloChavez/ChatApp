import 'dart:math';

import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/button_blue.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2F2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Logo(
              title: 'Messager',
            ),
            _Form(),
            Labels(
              ruta: 'register',
              labelRute: 'Crea una ahora!',
              label: '¿No tienes cuenta?',
            ),
            Text(
              'Términos y condiciones de uso',
              style: TextStyle(fontWeight: FontWeight.w200),
            )
          ],
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.email,
            placeholder: 'Correo electrónico',
            keyboardType: TextInputType.emailAddress,
            textControl: emailCtrl,
          ),
          CustomInput(
            icon: Icons.password,
            placeholder: 'Contraseña',
            keyboardType: TextInputType.visiblePassword,
            textControl: passwordCtrl,
            isPassword: true,
          ),
          ButtonBlue(
              text: 'Ingresar',
              color: Colors.blue,
              onPressed: authProvider.autenticando ? null : () {
                authProvider.login(emailCtrl.text, passwordCtrl.text);
                
              })
        ],
      ),
    );
  }
}
