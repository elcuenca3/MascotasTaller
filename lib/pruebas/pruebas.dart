// import 'package:card_swiper/card_swiper.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:puente_arcoiris/auth.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   static List<String> _images = [
//     "assets/slider/perro1.jpg",
//     "assets/slider/perro2.jpg",
//     "assets/slider/perro3.jpg"
//   ];

//   int _selectedIndex = 2;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static List<Widget> _widgetOptions = <Widget>[];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   Future<Map<String, dynamic>?> selectFromFirebase(
//       String tipoPlan, String tipoTipo) async {
//     final snapshot = await FirebaseFirestore.instance
//         .collection("planes")
//         .doc(
//           tipoPlan,
//         )
//         .collection("tipos")
//         .doc(tipoTipo)
//         .get();

//     Map<String, dynamic>? data = snapshot.data();
//     print(data);
//     print(data!['valor'] ?? "no hay data");

//     return data;
//   }

//   _HomeState() {
//     var paseoOro = selectFromFirebase('paseos', 'oro');
//     var paseoPlata = selectFromFirebase('paseos', 'plata');
//     var paseoPlatino = selectFromFirebase('paseos', 'platino');
//     _widgetOptions = <Widget>[
//       SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: FutureBuilder(
//             future: paseoOro,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Column(
//                   children: [
//                     Text(
//                       'Paseos paquete plata',
//                       style: optionStyle,
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           width: 100,
//                           child: Image(
//                             image: AssetImage("assets/paseos/paseos1.jpg"),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   "Valor: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(snapshot.data!["valor"].toString() ??
//                                     "Sin datos")
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Tiempo Limite: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text("1 mes")
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Paseos: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text("4 paseos")
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 Text(
//                                   "Promoción: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Baño a mitad de \nprecio",
//                                   // softWrap: true,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Text(
//                       'Paseos paquete Oro',
//                       style: optionStyle,
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           width: 100,
//                           child: Image(
//                             image: AssetImage("assets/paseos/paseos2.jpg"),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   "Valor: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text("gola")
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Tiempo Limite: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text("2 meses")
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Paseos: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text("8 paseos")
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Promoción: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text("Baño y corte de pelo \ngratis")
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Text(
//                       'Paseos paquete Platino',
//                       style: optionStyle,
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           width: 100,
//                           child: Image(
//                             image: AssetImage("assets/paseos/paseos3.jpg"),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   "Valor: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text("250.0")
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Tiempo Limite: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text("5 meses")
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Paseos: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text("20 paseos")
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Promoción: ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                     "3 baños, 1 corte de \npelo y revisión \nveterinaria gratis")
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 );
//               } else if (snapshot.hasError) {
//                 Text("No hay datos disponibles");
//               }
//               return CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//       Text(
//         'Index 1: Muerte',
//         style: optionStyle,
//       ),
//       // Home
//       SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               height: 250,
//               child: Swiper(
//                 viewportFraction: 0.8,
//                 scale: 0.9,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Image.asset(
//                     _images[index],
//                     fit: BoxFit.fill,
//                   );
//                 },
//                 itemCount: 3,
//                 pagination: SwiperPagination(),
//                 control: SwiperControl(),
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               padding: EdgeInsets.all(10),
//               width: double.infinity,
//               child: Text(
//                 'Paseos',
//                 style: optionStyle,
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       _onItemTapped(0);
//                     },
//                     child: Container(
//                       width: 100,
//                       height: 100,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                         child: Image(
//                           image: AssetImage("assets/paseos/paseos1.jpg"),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Container(
//                     width: 100,
//                     height: 100,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       child: Image(
//                         image: AssetImage("assets/paseos/paseos2.jpg"),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Container(
//                     width: 100,
//                     height: 100,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       child: Image(
//                         image: AssetImage("assets/paseos/paseos3.jpg"),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               padding: EdgeInsets.all(10),
//               width: double.infinity,
//               child: Text(
//                 'Baños',
//                 style: optionStyle,
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     width: 100,
//                     height: 100,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       child: Image(
//                         image: AssetImage("assets/banios/banios1.jpg"),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Container(
//                     width: 100,
//                     height: 100,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       child: Image(
//                         image: AssetImage("assets/banios/banios2.jpg"),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Container(
//                     width: 100,
//                     height: 100,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       child: Image(
//                         image: AssetImage("assets/banios/banios3.jpg"),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               padding: EdgeInsets.all(10),
//               width: double.infinity,
//               child: Text(
//                 'Veterinaria',
//                 style: optionStyle,
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     width: 100,
//                     height: 100,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       child: Image(
//                         image:
//                             AssetImage("assets/veterinaria/veterinaria1.jpg"),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Container(
//                     width: 100,
//                     height: 100,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       child: Image(
//                         image:
//                             AssetImage("assets/veterinaria/veterinaria2.jpg"),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Container(
//                     width: 100,
//                     height: 100,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       child: Image(
//                         image:
//                             AssetImage("assets/veterinaria/veterinaria3.jpg"),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       //Veteriinaria
//       SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: [
//               Text(
//                 'Veterinaria paquete plata',
//                 style: optionStyle,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 100,
//                     child: Image(
//                       image: AssetImage("assets/veterinaria/veterinaria1.jpg"),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "Valor: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("70.0")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Tiempo Limite: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("6 meses")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Veterinaria: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("2 consultas")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Promoción: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("Baño y paseo gratis")
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Veterinaria paquete Oro',
//                 style: optionStyle,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 100,
//                     child: Image(
//                       image: AssetImage("assets/veterinaria/veterinaria2.jpg"),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "Valor: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("100.0")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Tiempo Limite: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("12 meses")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Veterinaria: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                               "2 consutlas, \n2 desparatizaciones y \n5 vacunas (eleccion)")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Promoción: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("2 paseos y corte de \npelo gratis")
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Veterinaria paquete Platino',
//                 style: optionStyle,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 100,
//                     child: Image(
//                       image: AssetImage("assets/veterinaria/veterinaria3.jpg"),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "Valor: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("300.0")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Tiempo Limite: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("24 meses")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Veterinaria: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                               "4 baños. \n4 desparasitaciones, \n6 corte de uñas y \n5 vacunas (eleccion)")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Promoción: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("5 paseos, \n6 corte de pelo y \n6 baños gratis")
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),

//       // Baños
//       SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: [
//               Text(
//                 'Baños paquete plata',
//                 style: optionStyle,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 100,
//                     child: Image(
//                       image: AssetImage("assets/banios/banios1.jpg"),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "Valor: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("50.0")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Tiempo Limite: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("3 meses")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Baños: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("5 baños")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Promoción: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("Baño a mitad de \nprecio")
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Baños paquete Oro',
//                 style: optionStyle,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 100,
//                     child: Image(
//                       image: AssetImage("assets/banios/banios2.jpg"),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "Valor: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("100.0")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Tiempo Limite: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("4 meses")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Baños: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("5 baños")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Promoción: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("2 paseos y corte de \npelo gratis")
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Baños paquete Platino',
//                 style: optionStyle,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 100,
//                     child: Image(
//                       image: AssetImage("assets/banios/banios3.jpg"),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "Valor: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("300.0")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Tiempo Limite: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("12 meses")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Baños: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text("15 baños")
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Promoción: ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                               "3 paseos, 2 cortes de \npelo gratis y \nrevisión veterinaria \ngratis")
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Puente Arcoiris'),
//         actions: [
//           FloatingActionButton(
//             onPressed: () {
//               Auth().signOut();
//             },
//             child: Icon(Icons.outbond),
//           )
//         ],
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromRGBO(254, 246, 234, 1),
//             icon: ImageIcon(AssetImage("assets/iconos/paseo.png")),
//             label: 'Paseos',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromRGBO(254, 246, 234, 1),
//             icon: ImageIcon(AssetImage("assets/iconos/funeral.png")),
//             label: 'Muerte',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromRGBO(254, 246, 234, 1),
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromRGBO(254, 246, 234, 1),
//             icon: ImageIcon(AssetImage("assets/iconos/vet.png")),
//             label: 'Veterinaria',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromRGBO(254, 246, 234, 1),
//             icon: ImageIcon(AssetImage("assets/iconos/banios.png")),
//             label: 'Baños',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         unselectedItemColor: Colors.black,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }