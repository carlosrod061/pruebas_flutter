import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pruebas_flutter/models/solicitud.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<String> userData = [];
  var _userPromedio = TextEditingController();
  var _userIngreso = TextEditingController();
  String sResultado = "";

  void initState() {
    super.initState();
  }

  setResultado(bool bResultado) {
    setState(() {
      if (bResultado) {
        sResultado = "Su solicitud fue aprobada";
      } else {
        sResultado = "Su solicitud fue denegada";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Solicitud"),
        ),
        backgroundColor: Color(0xFF006064),
        body: Container(
            child: Padding(
          padding: EdgeInsets.fromLTRB(10, 50, 10, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Promedio:",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              TextField(
                controller: _userPromedio,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Ingrese el promedio del ultimo cuatrimestre",
                    hintStyle: TextStyle(color: Colors.lightBlue)),
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                // onSubmitted: (String value){addData(value);},
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ingreso semanal::",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              TextField(
                controller: _userIngreso,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Escriba el ingreso semanal",
                    hintStyle: TextStyle(color: Colors.lightBlue)),
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                // onSubmitted: (String value){addData(value);},
              ),
              ElevatedButton(
                  key: Key('btnValidaSolicitud'),
                  onPressed: () {
                    try {
                      bool prom_valido =
                          Solicitud.promedioValido(_userPromedio.text);
                      double salario_mensual =
                          Solicitud.calculaSalarioMensual(_userIngreso.text);

                      if (prom_valido) {
                        bool solicitud_Aprobada = Solicitud.solicitudAprobada(
                            double.parse(_userPromedio.text), salario_mensual);

                        setResultado(solicitud_Aprobada);
                      } else {
                        setResultado(false);
                      }
                    } catch (e) {
                      print("ERROR" + e.toString());
                    }
                  },
                  child: Text(
                    "Validar Solicitud",
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue)),
              Text(sResultado,
                  // Proporciona una Key a este widget Text específico. Esto nos permite
                  // identificar este widget específico desde adentro de nuestra suite de test y
                  // leer el texto.
                  key: Key('textResultado'),
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600))),
            ],
          ),
        )),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
