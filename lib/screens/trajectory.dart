import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:softcoop/widgets/timeline/vertical_timeline.dart';

// Definir un mapa con datos ficticios
Map<String, dynamic> _data = {
  "2016": [],
  "2017": [
    {"name": "Junta General de Socios", "fecha": "Noviembre 17"},
    {"name": "Junta General de Socios", "fecha": "Diciembre 17"}
  ],
  "2018": [],
  "2019": [],
  "2020": [],
  "2021": [],
  "2022": [
    {"name": "Junta General de Socios", "fecha": "Diciembre 17"}
  ],
  "2023": [],
  "2024": [],
};

// A continuación va el resto de la interfaz
class TrajectoryScreen extends StatelessWidget {
  const TrajectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            "Mi coop",
            style: TextStyle(
                fontFamily: "Poppins", fontSize: 18, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_to_queue),
              color: Colors.white,
            ),
          ],
        ),
        body: _MiCoopContainer());
  }
}

class _MiCoopContainer extends StatefulWidget {
  const _MiCoopContainer({
    super.key,
  });

  @override
  State<_MiCoopContainer> createState() => _MiCoopContainerState();
}

class _MiCoopContainerState extends State<_MiCoopContainer> {
  bool isEvent = false;
  String year = "";

  @override
  void initState() {
    // TODO: implement initState
    isEvent = false;
    year = "";
    super.initState();
  }

  void changeYearEvent(String key) {
    if (!isEvent) isEvent = true;
    year = key;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            height: isEvent ? size.height * 0.55 : null,
            color: Colors.white,
            child: _TimeLineContainer(
              size: Size(size.width, size.height - 56),
              data: _data,
              onTouch: (value) {
                changeYearEvent(value);
              },
            ),
          ),
        ),
        if (isEvent) _TrajectoryEvents(year: year)
      ]),
    );
  }
}

class _TimeLineContainer extends StatelessWidget {
  const _TimeLineContainer(
      {super.key, required this.size, required this.data, this.onTouch});

  final Map<String, dynamic> data;
  final Size size;
  final Function? onTouch;

  @override
  Widget build(BuildContext context) {
    final years = data.keys.toList();
    final items = List.generate(years.length, (index) {
      String key = years[index];
      List element = data[key];

      return TimeLineItem(
        size: Size(size.width, size.height * 0.1),
        title: years[index],
        content: Text("${element.length} eventos",
            style: const TextStyle(fontFamily: "Poppins", fontSize: 16)),
        onTouch: () {
          onTouch!(key);
        },
      );
    });
    return SizedBox(
      height: null,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: items),
      ),
    );
  }
}

class _TrajectoryEvents extends StatelessWidget {
  final String year;
  const _TrajectoryEvents({super.key, required this.year});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List element = _data[year];
    List<Widget> items = List.generate(element.length, (index) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              element[index]["name"],
              style: const TextStyle(fontFamily: "Poppins", fontSize: 16),
            ),
            Text(element[index]["fecha"])
          ],
        ),
      );
    });
    return Container(
      width: size.width,
      height: size.height * 0.36,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                year,
                style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items,
              )
            ],
          )),
    );
  }
}
