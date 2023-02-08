import 'package:flutter/material.dart';
import 'package:MascotasTaller/homepage.dart';
import 'package:MascotasTaller/acceso/registro.dart';
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
    return Padding(
        padding: EdgeInsets.all(16.0),child:ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? "- Login -" : "- Register -",style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 18)),
    ));
  }

  Widget entrar() {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => homePage()),
            );
          },
          child: Text("Entrar como Invitado"),
        ));
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      
      child: Text(isLogin ? " Register " : "Login", style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20)),
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
                      radius: 100 ,
                      backgroundColor:  Colors.transparent,
                      backgroundImage: AssetImage("assets/logoapp.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              child: _entryField("Correo", _controllerEmail)),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child:
                                _entryField("Contraseña", _controllerPassword),
                          ),
                          _submitButton(),
                          entrar(),
                          _loginOrRegisterButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
