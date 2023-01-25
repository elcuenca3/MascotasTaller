import 'package:flutter/material.dart';
import 'package:MascotasTaller/homepage.dart';
import 'package:MascotasTaller/registro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  String? errorMessage = '';
  bool isLogin = true;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text("Auth");
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: "Ingrese su correo",
          labelText: title,
          fillColor: Colors.white,
          filled: true),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == "" ? "" : "Hummm ? $errorMessage");
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? "Login" : "Register"),
    );
  }

  Widget entrar() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => homePage()),
        );
      },
      child: Text("Login"),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? "Register instead" : "Login instead"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login2.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50, top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Puente Arcoiris',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(249, 142, 44, 1),
                          fontSize: 20,
                          fontFamily: "Inter",
                          fontStyle: FontStyle.italic),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 95,
                      backgroundImage: AssetImage("assets/logoapp.png"),
                    ),
                    Column(
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: _entryField("Correo", _controllerEmail)),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: _entryField("Contraseña", _controllerPassword),
                        ),
                        _submitButton(),
                        entrar(),
                        _loginOrRegisterButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
