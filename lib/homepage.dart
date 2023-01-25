import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:MascotasTaller/acceso/login.dart';
import 'package:MascotasTaller/acceso/registro.dart';

import 'pruebas/ejemplo.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  static List<String> _images = [
    "assets/slider/p1.jpg",
    "assets/slider/p2.jpg",
    "assets/slider/p3.png"
  ];

  PageController? pageViewController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[];

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>?> selectFromFirebase(
      String tipoPlan, String locales) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("Servicios")
        .doc(
          tipoPlan,
        ).collection("local").doc(locales).get();

    Map<String, dynamic>? data = snapshot.data();
    print(data);
    print(data!['valor'] ?? "no hay data");

    return data;
  }

  int _selectedIndex = 1; // pagina que se muestra
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _homePageState() {
    var servicio1 = selectFromFirebase('Servicios', 'Alimentacion');
    var servicio2 = selectFromFirebase('Servicios', 'Funeraria');
    var servicio3 = selectFromFirebase('Servicios', 'Obituario');
    _widgetOptions = <Widget>[

      Servicios(),

      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Swiper(
                viewportFraction: 0.8,
                scale: 0.9,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _images[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3,
                pagination: SwiperPagination(),
                control: SwiperControl(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                Text(
                '¿Qué es Puente Arcoíris?',
                style: optionStyle,
              ),
              Padding( padding: const EdgeInsets.only(bottom: 25, top: 25),
                child:Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Ofrecemos el primer cementerio\n "
                      "de mascotas en la ciudad de Loja\n"
                      "el mismo que fue concebido para\n"
                      "dar ese último adiós a nuestras\n"
                      "mascotas que han formado parte\n"
                      "de nuestras vidas y con quienes\n"
                      "hemos compartido momentos felices.\n"
                      "Conoce nuestra oferta de productos\n"
                      "y servicios relacionados a\n"
                      "nuestras mascotas\n",
                      style:TextStyle(fontStyle: FontStyle.italic)),
                  Image.asset("assets/imgmain.png")
                ],
              ), )

              ],
            ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: servicio1,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(
                      'Alimentacion',
                      style: optionStyle,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Image(
                            image: AssetImage("assets/logoapp.png"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Valor: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(snapshot.data!["valor"].toString() ??
                                    "Sin datos")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "nombre: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("1 ")
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  
                  ],
                );
              } else if (snapshot.hasError) {
                Text("No hay datos disponibles");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    routes:
    <String, WidgetBuilder>{};
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:  Color.fromRGBO(254, 246, 234, 1),
      appBar: AppBar(
        //backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        title: Image.asset('assets/logo2.png', fit: BoxFit.cover, height: 60),
        backgroundColor: Colors.deepOrangeAccent,
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Container(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(254, 246, 234, 1),
            icon: Icon(Icons.add_circle),
            label: 'Servicios',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(254, 246, 234, 1),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(254, 246, 234, 1),
            icon: ImageIcon(AssetImage("assets/iconos/des.png")),
            label: 'Promos',
          ),
        ],
        selectedItemColor: Color.fromRGBO(249, 142, 44, 1),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
