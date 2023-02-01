import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(agghuman());

class agghuman extends StatelessWidget {
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
  late String _apellido;
  late String _edad;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void saveDataToFirestore(String name, String apellido, String edad) async {
    await _firestore.collection("usuarios").add({
      "nombre": name,
      "apellido": apellido,
      "edad": edad,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 234, 225),
      appBar: AppBar(
        title: Text('Agregar usuario'),
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
                decoration: InputDecoration(labelText: "apellido"),
                onSaved: (value) => _apellido = value!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese su apellido";
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    saveDataToFirestore(_name, _apellido, _edad);
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
