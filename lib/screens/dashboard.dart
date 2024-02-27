import 'package:flutter/material.dart';
import 'package:softcoop/widgets/inputs.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF172F3E),
        automaticallyImplyLeading: false,
        title: const Text(
          "Dashboard",
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 18, color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color(0xFFEDF1F3),
        height: size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const _DashboardUserID(),
              _DashboardMenu(width: size.width),
              _DashboardPersonalData(
                height: size.height * 0.4,
              ),
              _DashboardCooperativaData(
                height: size.height * 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardMenu extends StatelessWidget {
  const _DashboardMenu({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            color: Color(0xFF172F3E),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        width: width,
        height: 120,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _DashboardMenuItem(
                icon: Icons.calendar_month,
                onTap: () {
                  Navigator.popAndPushNamed(context, "/mi-coop");
                },
              ), // Mi coop
              _DashboardMenuItem(
                icon: Icons.settings,
                onTap: () {
                  Navigator.popAndPushNamed(context, "/settings");
                },
              ), // Configuraciones
              _DashboardMenuItem(
                icon: Icons.business,
                onTap: () {
                  Navigator.popAndPushNamed(context, "/junta-socios");
                },
              ), // Junta General de Socios
              _DashboardMenuItem(
                icon: Icons.people,
                onTap: () {
                  Navigator.popAndPushNamed(context, "/users");
                },
              ), // Usuarios
            ],
          ),
        ));
  }
}

class _DashboardUserID extends StatelessWidget {
  const _DashboardUserID({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF172F3E),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jhon Doe",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Poppins", fontSize: 15),
              ),
              Text(
                "Cooperativa 1 SpA",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Poppins", fontSize: 15),
              ),
            ],
          ),
          Badge(color: Colors.green, content: "Presidente")
        ],
      ),
    );
  }
}

class _DashboardMenuItem extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  const _DashboardMenuItem(
      {super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 100,
        height: size.height,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            color: Color(0xFFEDF1F3),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Color(0xFFC41E3D), width: 3.5)),
        child: Icon(
          icon,
          size: 50,
          color: Colors.black26,
        ),
      ),
    );
  }
}

class _DashboardPersonalData extends StatelessWidget {
  final double height;

  const _DashboardPersonalData({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Datos Personales",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            TextInput(
              labelTxt: "Email",
              initialValue: "jhondoe@email.cl",
              enabled: false,
            ),
            TextInput(
              labelTxt: "Rut",
              initialValue: "xx.xxx.xxx-x",
              enabled: false,
            ),
            TextInput(
              labelTxt: "Fecha de ingreso",
              initialValue: "20/04/2024",
              enabled: false,
            ),
            TextInput(
              labelTxt: "Rol dentro del sistema",
              initialValue: "Administrador",
              enabled: false,
            )
          ],
        ));
  }
}

class _DashboardCooperativaData extends StatelessWidget {
  const _DashboardCooperativaData({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Datos de la cooperativa",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            TextInput(
              labelTxt: "Razón Social",
              initialValue: "Cooperativa de prueba SpA",
              enabled: false,
            ),
            TextInput(
              labelTxt: "Comuna",
              initialValue: "Comuna",
              enabled: false,
            ),
            TextInput(
              labelTxt: "Región",
              initialValue: "Región",
              enabled: false,
            ),
            TextInput(
              labelTxt: "Sigla",
              initialValue: "Cooperativa de prueba",
              enabled: false,
            ),
            TextInput(
              labelTxt: "Web",
              initialValue: "http://cooperativasdechile.cl",
              enabled: false,
            )
          ],
        ));
  }
}

class Badge extends StatelessWidget {
  const Badge({super.key, required this.color, required this.content});

  final Color color;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(
        content.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
