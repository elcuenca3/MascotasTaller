import 'package:MascotasTaller/ejemplo.dart';
import 'package:flutter/material.dart';
import 'package:MascotasTaller/homepage.dart';
import 'splash.dart';
import 'login.dart';
import 'registro.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAz6sg4EOZIozPYt420vCmE9-u6J60Axk4',
    appId: '1:834291257005:android:49b8553fc28b8924c08024',
    messagingSenderId: '834291257005',
    projectId: 'puente-paraiso',
    storageBucket: 'puente-paraiso.appspot.com',
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
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20,fontFamily: 'Raleway'));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 234, 225),
      body: Center(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AppBar(
                backgroundColor: Color.fromRGBO(231, 134, 83, 53),
                automaticallyImplyLeading: false,
                title: Text(
                  'Puente Arcoiris',
                  style: TextStyle(fontSize: 25),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2,
              ),
              Image.asset(
                'assets/logoapp.png',
                width: 303,
                height: 248,
                fit: BoxFit.cover,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyLogin()),
                  );
                },
                child: Text("Login"),
                style: style,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyRegister()),
                  );
                },
                child: Text("Registro"),
                style: style,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Servicios()),
                  );
                },
                child: Text("Servicios"),
                style: style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
