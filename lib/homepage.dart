import 'package:MascotasTaller/pruebas/ejemplo.dart';
import 'package:MascotasTaller/pruebas/mascota.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:MascotasTaller/acceso/login.dart';
import 'package:MascotasTaller/acceso/registro.dart';

import 'pruebas/ejemplo.dart';
import 'pruebas/humano.dart';

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
        )
        .collection("Local")
        .doc(locales)
        .get();

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
    // var servicio2 = selectFromFirebase('Servicios', 'Funeraria');
    // var servicio3 = selectFromFirebase('Servicios', 'Obituario');
    _widgetOptions = <Widget>[
      //SERVICIOS
      Servicios(),
      //HOME
      SingleChildScrollView(
        child: Column(
          children: [
            // CarouselSlider(items: _images, options: CarouselOptions)
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
                  Text("- SOBRE MASCOTAS -",
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 11,
                          color: Colors.deepOrange)),
                  SizedBox(height: 5),
                  Text(
                    '¿Qué es Puente Arcoíris?',
                    style: optionStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 23, top: 23),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            "Ofrecemos el primer cementerio\n "
                            "de mascotas en la ciudad de Loja\n"
                            "el mismo que fue concebido para\n"
                            "dar ese último adiós a nuestras\n"
                            "mascotas que han formado parte\n"
                            "de nuestras vidas y con quienes\n"
                            "hemos compartido momentos felices.\n"
                            "Conoce nuestra oferta de productos\n"
                            "y servicios relacionados a\n"
                            "nuestras mascotas\n",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 11)),
                        Image.asset("assets/imgmain.png"),
                      ],
                    ),
                  ),
                  Text("- SERVICIOS -",
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 11,
                          color: Colors.deepOrange)),
                  SizedBox(height: 5),
                  Text(
                    'Lo que tenemos para ofrecerte',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        elevation: 20,
                        shadowColor: Colors.black,
                        color: Colors.lightBlueAccent,
                        child: SizedBox(
                          width: 180,
                          height: 102,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(2, 0, 0, 0),
                                  title: Text('Servicio 24 horas',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'Ofrecemos un servicio integral, 24 horas al día los 365 días del año.',
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black)),
                                  leading: Icon(Icons.access_time_rounded,
                                      color: Color.fromRGBO(249, 142, 44, 1),
                                      size: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 20,
                        shadowColor: Colors.black,
                        color: Colors.lightBlueAccent,
                        child: SizedBox(
                          width: 180,
                          height: 102,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(2, 0, 0, 0),
                                  title: Text('Funerales',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'Una despedida como tu mascota se lo merece',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black)),
                                  leading: Image.asset("assets/iconos/fune.png",
                                      color: Color.fromRGBO(249, 142, 44, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        elevation: 20,
                        shadowColor: Colors.black,
                        color: Colors.lightBlueAccent,
                        child: SizedBox(
                          width: 180,
                          height: 102,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(2, 0, 0, 0),
                                  title: Text('Cremación',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'Deseamos mantener sus recuerdos intactos para ti y tu familia.',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black)),
                                  leading: Image.asset(
                                      "assets/iconos/crema.png",
                                      color: Color.fromRGBO(249, 142, 44, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 20,
                        shadowColor: Colors.black,
                        color: Colors.lightBlueAccent,
                        child: SizedBox(
                          width: 180,
                          height: 102,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(2, 0, 0, 0),
                                  title: Text('Sala de Despedida',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'Espacios cómodos y ambientados especialmente para tu ser querido.',
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black)),
                                  leading: Icon(Icons.church,
                                      color: Color.fromRGBO(249, 142, 44, 1),
                                      size: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  //Obitarios
                  Text("- MASCOTAS EN PAZ -",
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 11,
                          color: Colors.deepOrange)),
                  SizedBox(height: 15),
                  /*
                       ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){},
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepOrange),
                                child: Center(child: Text('Slider 1',style: TextStyle(fontSize: 37, color: Colors.white))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){},
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepOrange),
                                child: Center(child: Text('Slider 2',style: TextStyle(fontSize: 37, color: Colors.white))),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){},
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepOrange),
                                child: Center(child: Text('Slider 3',style: TextStyle(fontSize: 37, color: Colors.white))),
                              ),
                            ),
                          ),
                        ],
                      )
                  */
                ],
              ),
            ),
          ],
        ),
      ),

      //PROMOS
      ListWheelScrollView(
          itemExtent: 250,
          physics: FixedExtentScrollPhysics(),
          children: [
            Center(
                child: Container(
              child: Image(
                image: AssetImage("assets/promo.png"),
              ),
            )),
            Center(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.star),
                      title: const Text('Pro-can: Razas Pequeñas 454g'),
                      subtitle: Text(
                        'Pollo, cereales y leche',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                            "https://scontent.floh3-1.fna.fbcdn.net/v/t1.6435-9/105405519_116333980119912_4298454532973809772_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=9267fe&_nc_ohc=h0nxcGiL02MAX_AXNRm&_nc_ht=scontent.floh3-1.fna&oh=00_AfAjMHqF7dxH8plo0E5rT7v60Cx-KS1C6l5f-ux81weUSA&oe=64013555",
                            height: 130),
                        Text(
                            "• Alimenta a tu cachorro hasta \n  sus 12 meses de edad.\n"
                            "• Contiene todas las proteínas,\n  vitaminas, minerales.\n"
                            "• Cumplir con la necesidad \n  nutricional de un cachorro.\n",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 12)),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('Visitar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.star),
                      title:
                          const Text('Plan de Seguro Veterinario en Vital Vet'),
                      subtitle: Text(
                        'La salud de tu mascota siempre es lo primero',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4F1lUkMbPhIhEi83bP_EfyHIXlGBdZI3D7w&usqp=CAU",
                            height: 85),
                        Text(
                            "• Revisiones\n"
                            "• Vacunación anual de Rabia.\n"
                            "• Vacuna de polivalente canina.\n"
                            "• Vacunación de traqueobronquitis\n  infecciosa\n"
                            "• Desparasitación interna trimestral\n"
                            "• 20% de descuento en radiografia\n",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 10)),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('Visitar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.star),
                      title: const Text('Promo Peluqueria Canina en Pekitas'),
                      subtitle: Text(
                        'Ven y aprovecha nuestra promoción',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5ZDPoFm_SdXabGo2yn7_1Sfi9vlPGrp8OHQ&usqp=CAU",
                            height: 100),
                        Text(
                            "• Solo por el 19 y 20 de Marzo,\n  te ofrecemos el 20% de descuento\n  en Peluquería Canina",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 12)),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('Visitar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.star),
                      title: const Text('Adiestra a tu mascota'),
                      subtitle: Text(
                        'Canes Loja adiestramiento Canino, Guarderia Canina y Tienda de Accesorios',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5pxY54xKytFOhkT2KZ698Vs3I7Gh2IPDqFw&usqp=CAU",
                            height: 120),
                        Text(
                            "Contamos con:\n\n"
                            "• ADIESTRAMIENTO CANINO\n"
                            "• GUARDERÍA CANINA\n"
                            "• HOTEL CANINO\n"
                            "• PELUQUERÍA CANINA\n"
                            "• PASEOS CANINOS\n",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 13)),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('Visitar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.star),
                      title: const Text('Spa y Peluquería Canina Firulais'),
                      subtitle: Text(
                        'Somos un spa y peluquería canina de especialidad dedicados al cuidado de tu mascota',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTztz5cA0mSmTpcYzNjxs8BEQrWL4sskVAhHQ&usqp=CAU",
                            height: 100),
                        Text(
                            "Hacemos tratamientos naturales \n de manto y mucho más \n Contamos con:\n\n"
                            "• PELUQUERÍA CANINA\n"
                            "• PASEOS CANINOS\n",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 12)),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('Visitar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
      Perfiles(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    <String, WidgetBuilder>{};
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromRGBO(254, 246, 234, 1),
      appBar: AppBar(
        //backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        title: Image.asset('assets/logo2.png', fit: BoxFit.cover, height: 60),
        backgroundColor: Colors.deepOrangeAccent,
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
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
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(254, 246, 234, 1),
            icon: ImageIcon(AssetImage("assets/iconos/cliente.png")),
            label: 'Perfiles',
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
