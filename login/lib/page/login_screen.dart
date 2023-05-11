// ignore_for_file: unnecessary_import, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../ui/ui.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              CardContainer(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'login',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //todo change fire provider
                ],
              )),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, 'registrar'),
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.grey),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: const Text(
                    'Crear nueva cuenta',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginFrom extends StatelessWidget {
  // todo: loginform
  const _LoginFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        // toso: key: loginform.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'eros.gy@delicias.tecnm.mx',
                  labelText: 'correo electronico',
                  prefixIcon: Icons.alternate_email),
              //TODO: Validacion de correo electronico
            ),
            SizedBox(height: 30),
            TextField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*******',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
            ),
            SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.orangeAccent,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
