import 'package:MascotasTaller/pruebas/humanoagg.dart';
import 'package:MascotasTaller/pruebas/mascota.dart';
import 'package:MascotasTaller/pruebas/mascotagg.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:MascotasTaller/acceso/login.dart';
import 'package:MascotasTaller/acceso/registro.dart';

class Perfiles extends StatefulWidget {
  @override
  _PerfilesState createState() => _PerfilesState();
}

class _PerfilesState extends State<Perfiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('usuarios').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  return Text('Loading...');
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.account_box_rounded),
                            title: Text("Nombre: " +
                                document['nombre'] +
                                " " +
                                document['apellido'] +
                                "\n"),
                            trailing: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => mascotasagg()),
                                );
                              },
                              child: Text("Agregar mascota"),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => agghuman()),
              );
            },
            child: Text("Agregar humano"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mascota()),
              );
            },
            child: Text("Revisar Mascotas"),
          ),
        ],
      ),
    );
  }
}
