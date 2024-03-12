import 'package:flutter/material.dart';
import 'package:softcoop/widgets/buttons.dart';
import 'package:softcoop/widgets/inputs.dart';

/* 
TO-DO:
* Conectar formulario con el endpoint respectivo
*/

class JuntaGeneralSociosScreen extends StatefulWidget {
  const JuntaGeneralSociosScreen({super.key});

  @override
  State<JuntaGeneralSociosScreen> createState() =>
      _JuntaGeneralSociosScreenState();
}

class _JuntaGeneralSociosScreenState extends State<JuntaGeneralSociosScreen> {
  // Form states
  bool isJuntaGeneral = false;
  bool nextStep = false;

  // Estados para la junta general de socios
  bool isFirstSemester = false;
  bool hasProblemsLast = false;
  bool addMembers = false;
  bool deleteMembers = false;

  @override
  void initState() {
    // TODO: implement initState
    isJuntaGeneral = false;
    nextStep = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF172F3E),
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/dashboard");
          },
          icon: const Icon(Icons.keyboard_arrow_left),
          color: Colors.white,
        ),
        title: const Text(
          "Junta General de Socios",
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 18, color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: const Color(0xFFEDF1F3),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Switch(
                          inactiveTrackColor: Color(0xFFE2294F),
                          activeTrackColor: Colors.green,
                          inactiveThumbColor: Colors.white,
                          activeColor: Colors.white,
                          value: isJuntaGeneral,
                          onChanged: (value) {
                            isJuntaGeneral = value;
                            setState(() {});
                          }),
                      const Text("¿Desea realizar su junta general de socios?")
                    ],
                  )),
              if (isJuntaGeneral)
                Container(
                  width: size.width,
                  height: size.height * 0.45,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextInput(
                          labelTxt: "Fecha",
                          initialValue: "12/03/2024",
                          onChange: (value) {}),
                      TextInput(
                          labelTxt: "Horario 1",
                          initialValue: "12/03/2024",
                          onChange: (value) {}),
                      TextInput(
                          labelTxt: "Horario 2",
                          initialValue: "12/03/2024",
                          onChange: (value) {}),
                      TextInput(
                          labelTxt: "Dirección",
                          initialValue: "Calle Falsa #123",
                          onChange: (value) {}),
                      Button(
                          valueBtn: "Siguiente",
                          press: () {
                            nextStep = !nextStep;
                            setState(() {});
                          })
                    ],
                  ),
                ),
              if (nextStep)
                Container(
                  width: size.width,
                  height: size.height * 0.7,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSwitch(
                          initialValue: addMembers,
                          onChange: (value) {
                            addMembers = value;
                            setState(() {});
                          },
                          content: "¿Ha realizado incorporación de socios?"),
                      if (addMembers)
                        Button(
                            valueBtn: "Seleccionar rango de fecha",
                            press: () {
                              showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime.now()
                                      .subtract(const Duration(days: 365)),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 365)));
                            }),
                      CustomSwitch(
                          initialValue: deleteMembers,
                          onChange: (value) {
                            deleteMembers = value;
                            setState(() {});
                          },
                          content: "¿Ha realizado eliminación de socios?"),
                      if (deleteMembers)
                        Button(
                            valueBtn: "Seleccionar rango de fecha",
                            press: () {
                              showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime.now()
                                      .subtract(const Duration(days: 365)),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 365)));
                            }),
                      TextInput(
                          labelTxt: "Comentarios sobre balance económico",
                          onChange: (value) {}),
                      TextInput(labelTxt: "Excedentes", onChange: (value) {}),
                      CustomSwitch(
                          initialValue: hasProblemsLast,
                          onChange: (value) {
                            hasProblemsLast = value;
                            setState(() {});
                          },
                          content:
                              "¿Ha tenido problemas con la realización de juntas generales de socios anteriores?"),
                      CustomSwitch(
                          initialValue: isFirstSemester,
                          onChange: (value) {
                            isFirstSemester = value;
                            setState(() {});
                          },
                          content:
                              "¿Está realizando su junta general de socios en el primer semestre?"),
                      Button(
                          valueBtn: "Crear junta general de socios",
                          press: () {})
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
