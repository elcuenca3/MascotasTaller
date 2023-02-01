import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(mascotasagg());

class mascotasagg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario con Flutter y Cloud Firestore',
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;
  late String _edad;
  late String _tipo;
  late String _sexo;
  late String _raza;
  List<String> _options = ['Perro', 'Gato'];
  String _selectedOption = 'Perro';
  String selectedOption = "";

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void saveDataToFirestore(
      String name, String edad, String tipo, String sexo, String raza) async {
    await _firestore.collection("Mascotas").add({
      "nombre": name,
      "edad": edad,
      "tipo": tipo,
      "sexo": sexo,
      "raza": raza,
    });
  }

  void initState() {
    _selectedOption = _options[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 234, 225),
      appBar: AppBar(
        title: Text('Agregar Mascotas'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Nombre"),
                onSaved: (value) => _name = value!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese su nombre";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "edad"),
                onSaved: (value) => _edad = value!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese su edad";
                  }
                },
              ),
              // TextFormField(
              //   decoration: InputDecoration(labelText: "tipo"),
              //   onSaved: (value) => _tipo = value!,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return "Por favor ingrese su edad";
              //     }
              //   },
              // ),
              DropdownButton<String>(
                value: _selectedOption,
                items: _options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) => _tipo = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Sexo"),
                onSaved: (value) => _sexo = value!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese su Sexo";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Raza"),
                onSaved: (value) => _raza = value!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese su Raza";
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    saveDataToFirestore(_name, _edad, _tipo, _sexo, _raza);
                    Navigator.pop(context);
                  }
                },
                child: Text("Guardar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
