// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late File _image;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child:
//               _image == null ? Text('No image selected.') : Image.file(_image),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             final image =
//                 await ImagePicker().getImage(source: ImageSource.gallery);
//             setState(() {
//               _image = File(image!.path);
//             });
//             final Reference ref = FirebaseStorage.instance
//                 .ref()
//                 .child('flutter-tests')
//                 .child('/some-image.jpg');
//             print('File Uploaded');
//           },
//           child: Icon(Icons.add_a_photo),
//         ),
//       ),
//     );
//   }
// }
