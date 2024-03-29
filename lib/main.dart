import 'package:MascotasTaller/pruebas/ejemplo.dart';
import 'package:MascotasTaller/acceso/widget_tree.dart';
import 'package:MascotasTaller/pruebas/humanoagg.dart';
import 'package:flutter/material.dart';
import 'package:MascotasTaller/homepage.dart';
import 'splash.dart';
import 'acceso/login.dart';
import 'acceso/registro.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDqaPVBLGTHdYvGhcy1Xlm4yDp1SP8CG5E',
    appId: '1:145808704707:android:60c4f4f42fa4b463b9ce76',
    messagingSenderId: '145808704707',
    projectId: 'arcoiris-89a71',
    storageBucket: 'arcoiris-89a71.appspot.com',
  ));
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avance de MascotasTaller',
      home: Splash(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: <String, WidgetBuilder>{
        "/inicio": (BuildContext context) => MyHomePage(title: 'Flutter'),
        "/login": (BuildContext context) => MyLogin(),
        "/home": (BuildContext context) => homePage(),
        "/agghuman": (BuildContext context) => agghuman(),
      },
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20, fontFamily: 'Raleway'));
    // final botonLogin = new ElevatedButton(
    //   child: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Row(
    //       children: [
    //         Icon(Icons.key),
    //         SizedBox(width: 10),
    //         Text("LOGIN"),
    //       ],
    //     ),
    //   ),
    //   style: ElevatedButton.styleFrom(
    //       backgroundColor: Color.fromRGBO(212, 163, 115, 1),
    //       elevation: 5,
    //       shadowColor: Colors.black),
    //   onPressed: () {
    //     Navigator.pushNamed(context, "/login");
    //   },
    // );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 234, 225),
      body: Center(child: WidgetTree()),
    );

    // backgroundColor: Color.fromARGB(255, 243, 234, 225),
    // body: Center(
    //   child: GestureDetector(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.max,
    //       children: [
    //         AppBar(
    //           backgroundColor: Color.fromRGBO(231, 134, 83, 53),
    //           automaticallyImplyLeading: false,
    //           title: Text(
    //             'Puente Arcoiris',
    //             style: TextStyle(fontSize: 25),
    //           ),
    //           actions: [],
    //           centerTitle: false,
    //           elevation: 2,
    //         ),
    //         Image.asset(
    //           'assets/logoapp.png',
    //           width: 303,
    //           height: 248,
    //           fit: BoxFit.cover,
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => MyLogin()),
    //             );
    //           },
    //           child: Text("Login"),
    //           style: style,
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => MyRegister()),
    //             );
    //           },
    //           child: Text("Registro"),
    //           style: style,
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => Servicios()),
    //             );
    //           },
    //           child: Text("Servicios"),
    //           style: style,
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
    //);
  }
}
