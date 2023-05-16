// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _succes;
  late String? _userEmail;

  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        _succes = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _succes = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hola de Nuevo!",
            style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "Por Favor Registra tu Correo y Password",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 44.0,
          ),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Correo Electronico",
              prefixIcon: Icon(Icons.mail, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 88.0,
          ),
          SizedBox(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color(0xFF0069FE),
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () async {
                _register();
              },
              child: const Text(
                "Registrarse",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          SizedBox(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color(0xFF0069FE),
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text(
                "Regresar",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
