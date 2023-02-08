import 'package:MascotasTaller/pruebas/humanoagg.dart';
import 'package:MascotasTaller/pruebas/mascotagg.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:MascotasTaller/acceso/login.dart';
import 'package:MascotasTaller/acceso/registro.dart';

class mascota extends StatefulWidget {
  @override
  _mascotaState createState() => _mascotaState();
}

class _mascotaState extends State<mascota> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mascotas Registradas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Mascotas').snapshots(),
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
                            title: Text("Nombre: "+document['nombre'] +
                                " " +
                                "\nTipo :"+document['tipo']
                                +"\nEdad: "+document['edad'] +" Años"),
                            // trailing: ElevatedButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => mascotasagg()),
                            //     );
                            //   },
                            //   child: Text("Agregar mascota"),
                            // ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => agghuman()),
          //     );
          //   },
          //   child: Text("Agregar humano"),
          // ),
        ],
      ),
    );
  }
}
