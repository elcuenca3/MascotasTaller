// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/material.dart';
// import 'package:card_swiper/card_swiper.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:MascotasTaller/acceso/login.dart';
// import 'package:MascotasTaller/acceso/registro.dart';

// class FirebaseExample extends StatefulWidget {
//   @override
//   _FirebaseExampleState createState() => _FirebaseExampleState();
// }

// class _FirebaseExampleState extends State<FirebaseExample> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('coleccion')
//                   .snapshots(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 }
//                 if (!snapshot.hasData) {
//                   return Text('Loading...');
//                 }
//                 return ListView(
//                   children:
//                       snapshot.data!.docs.map((DocumentSnapshot document) {
//                     return ListTile(
//                       title: Text(document['campo']),
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Agregar dato",
//               ),
//               onSubmitted: (value) {
//                 FirebaseFirestore.instance
//                     .collection('coleccion')
//                     .add({'campo': value});
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
