import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:softcoop/widgets/buttons.dart';
import 'package:softcoop/widgets/inputs.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [_LogInHeader(), _LogInBody()],
          ),
        ),
      ),
    );
  }
}

class _LogInHeader extends StatelessWidget {
  const _LogInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.3,
      color: Colors.green,
      child: Image.asset(
        'assets/img/login_header.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class _LogInBody extends StatelessWidget {
  const _LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      height: size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Iniciar sesión",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Form(
            child: SizedBox(
              height: size.height * 0.25,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextInput(
                    labelTxt: "Rut Cooperativa",
                    placeholder: "Hola mundo",
                  ),
                  TextInput(
                    labelTxt: "Rut Socio",
                    placeholder: "Hola mundo",
                  ),
                  TextInput(
                    labelTxt: "Contraseña",
                    placeholder: "****",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  valueBtn: "Acceder",
                  press: () {
                    Navigator.pushNamed(context, "/dashboard");
                  },
                ),
                const Text(
                  "¿Ha olvidado su contraseña?",
                  style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
