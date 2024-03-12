import 'package:flutter/material.dart';
import 'package:softcoop/widgets/buttons.dart';
import 'package:softcoop/widgets/inputs.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF172F3E),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/dashboard");
          },
          icon: const Icon(Icons.keyboard_arrow_left),
          color: Colors.white,
        ),
        title: const Text(
          "Configuraciones",
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 18, color: Colors.white),
        ),
      ),
      body: Container(
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: const Color(0xFFEDF1F3),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _ChangePassword(size: size),
              _ChangeUserData(size: size)
            ],
          ),
        ),
      ),
    );
  }
}

class _ChangeUserData extends StatelessWidget {
  const _ChangeUserData({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        height: size.height * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Modificar datos personales",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            TextInput(
              labelTxt: "Nombre",
              icon: Icon(Icons.person),
              initialValue: "Jhon",
              onChange: (value) {},
            ),
            TextInput(
              labelTxt: "Apellido",
              icon: Icon(Icons.person),
              initialValue: "Doe",
              onChange: (value) {},
            ),
            TextInput(
              labelTxt: "Email",
              icon: Icon(Icons.email),
              initialValue: "jhondoe@email.cl",
              onChange: (value) {},
            ),
            Button(valueBtn: "Actualizar", press: () {})
          ],
        ));
  }
}

class _ChangePassword extends StatelessWidget {
  const _ChangePassword({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.4,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recuperar contraseña",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            TextInput(
              labelTxt: "Contraseña actual",
              icon: Icon(Icons.lock),
              initialValue: "****",
              onChange: (value) {},
            ),
            TextInput(
              labelTxt: "Nueva contraseña",
              icon: Icon(Icons.lock),
              initialValue: "****",
              onChange: (value) {},
            ),
            TextInput(
              labelTxt: "Repetir nueva contraseña",
              icon: Icon(Icons.lock),
              initialValue: "****",
              onChange: (value) {},
            ),
            Button(valueBtn: "Actualizar", press: () {})
          ],
        ));
  }
}
