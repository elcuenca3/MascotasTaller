import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:MascotasTaller/login.dart';
import 'package:MascotasTaller/registro.dart';

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

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("1")),
                ElevatedButton(onPressed: () {}, child: Text("2")),
                ElevatedButton(onPressed: () {}, child: Text("3"))
              ],
            ),
          ),
        ],
      ),
    ),
    SingleChildScrollView(
      child: Text("hola son la pantalla 2")
    ),
    SingleChildScrollView(
      child: Text("hola son la pantalla 3")
    ),
    SingleChildScrollView(
      child: Text("hola son la pantalla 4")
    ),
    SingleChildScrollView(
      child: Text("hola son la pantalla 5")
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.amber,
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
            icon: Icon(Icons.accessible_forward_rounded),
            label: 'Paseos',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(254, 246, 234, 1),
            icon: Icon(Icons.desktop_access_disabled),
            label: 'Muerte',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(254, 246, 234, 1),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(254, 246, 234, 1),
            icon: Icon(Icons.add_circle),
            label: 'Veterinaria',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(254, 246, 234, 1),
            icon: Icon(Icons.accessibility),
            label: 'Baños',
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
