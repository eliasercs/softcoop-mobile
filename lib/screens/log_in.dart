import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:softcoop/api/auth.dart';
import 'package:softcoop/services/login.dart';
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

class _LogInBody extends StatefulWidget {
  const _LogInBody({super.key});

  @override
  State<_LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<_LogInBody> {
  final _formKey = GlobalKey<FormState>();
  String runSocio = "";
  String runCooperativa = "";
  String password = "";

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
            key: _formKey,
            child: SizedBox(
              height: size.height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextInput(
                    labelTxt: "Rut Cooperativa",
                    placeholder: "12.345.678-9",
                    onChange: (value) {
                      runCooperativa = value;
                      setState(() {});
                    },
                  ),
                  TextInput(
                    labelTxt: "Rut Socio",
                    placeholder: "12.345.678-9",
                    onChange: (value) {
                      runSocio = value;
                      setState(() {});
                    },
                  ),
                  TextInput(
                    labelTxt: "Contraseña",
                    placeholder: "****",
                    onChange: (value) {
                      password = value;
                      setState(() {});
                    },
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
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> data = {
                        "runCoop": runCooperativa,
                        "runSocio": runSocio,
                        "password": password
                      };
                      final response = await Auth().signIn(data);

                      if (response["ok"]) {
                        if (context.mounted) {
                          Navigator.pushNamed(context, "/dashboard");
                        }
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger(
                            child: SnackBar(
                              content: Text(response["msg"]),
                            ),
                          );
                        }
                      }
                    }
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
