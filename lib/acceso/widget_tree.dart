
import 'package:MascotasTaller/acceso/auth.dart';
import 'package:MascotasTaller/homepage.dart';
import 'package:MascotasTaller/acceso/login.dart';
import 'package:flutter/material.dart';
import 'package:MascotasTaller/main.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);
  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return homePage();
        } else {
          return MyLogin();
        }
      },
    ); // StreamBuilder
  }
}