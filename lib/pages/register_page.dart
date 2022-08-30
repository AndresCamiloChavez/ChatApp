import 'dart:math';

import 'package:chat_app/widgets/button_blue.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

import '../widgets/labels.dart';
import '../widgets/logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2F2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Logo(title: 'Registro',),
            _Form(),
            Labels(ruta:'login', labelRute: 'Ingresa ahora!', label: '¿Ya tienes una cuenta?' ,),
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
  final nametCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.person,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textControl: nametCtrl,
          ),
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
          ButtonBlue(text: 'Ingresar', color: Colors.blue, onPressed: (){
          })
        ],
      ),
    );
  }
}
