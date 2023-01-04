import 'package:flutter/material.dart';
import 'splash.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avance de Proyecto',
      home: Splash(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "/login" :(BuildContext context)=> Login(),
        "/inicio" :(BuildContext context)=> MyHomePage(title: "title"),
      },
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
    //boton 1 servicios
    final button1 =  ElevatedButton(
      child: Text("Login"),
      style: ElevatedButton.styleFrom(primary: Colors.deepOrange,onPrimary: Colors.black),
      onPressed: (){
        print("/login");
        Navigator.pushNamed(context, "/login");
      },
    );
    final button2 =  ElevatedButton(
      child: Text("Registro"),
      style: ElevatedButton.styleFrom(primary: Colors.deepOrange,onPrimary: Colors.black),
      onPressed: (){
        print("/regis");
        Navigator.pushNamed(context, "/regis");
      },
    );

    return Scaffold(
      appBar: AppBar(
        //title: Text("Widgets"),
        //centerTitle: true,
        //title: Image.asset('logo2.png', fit: BoxFit.cover, height: 50),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                button1,
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                button2,

              ],
            ),
          ],
        ),
      ),
    );
  }
}