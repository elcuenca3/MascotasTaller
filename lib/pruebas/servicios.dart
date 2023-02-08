import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Servicios1 extends StatefulWidget {
  @override
  _PerfilesState createState() => _PerfilesState();
}

class _PerfilesState extends State<Servicios1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('servicios').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              
              return  Card(
                child: Column(
                  children: [
                    
                    ListTile(
                      leading: Image.asset(
                        document['imagen'],
                        width: 100,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                      title: Text(document['title'], style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20),),
                      subtitle: Text(document['description']),
                    ),
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          child: Text('Detalles'),
                          onPressed: () {
                            /* Handle button press */
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
