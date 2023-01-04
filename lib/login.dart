import 'package:flutter/material.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          //title: Text("Widgets"),
          //centerTitle: true,
          title: Image.asset('logo2.png', fit: BoxFit.cover, height: 50),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Image(
                  image: NetworkImage('https://raw.githubusercontent.com/RommelOjeda/Movilesproyecto/main/Proyecto/assets/logoapp.png'),
                  height: 140,
                ),
              ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo Electrónico',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('',),),
            Container(

                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Ingresar'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent,onPrimary: Colors.black),

                )

            ),
            Row(
              children: <Widget>[
                const Text('No tienes una cuenta?'),
                TextButton(
                  child: const Text(
                    'Registrate!',
                    style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}