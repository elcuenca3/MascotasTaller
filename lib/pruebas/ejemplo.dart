import 'package:flutter/material.dart';

class Servicios extends StatefulWidget {
  const Servicios({Key? key}) : super(key: key);

  @override
  _ServiciosState createState() => _ServiciosState();
}

class _ServiciosState extends State<Servicios> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 243, 234, 225),
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 40, 0, 40),
                  child: Text('-Servicios-'),
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(231, 134, 83, 53),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x3600000F),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1491637639811-60e2756cc1c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                  width: 100,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                                child: Text(
                                  'Funerario',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(231, 134, 83, 53),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x3600000F),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1541643600914-78b084683601?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                  width: 100,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                                child: Text(
                                  'Peluqueria',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(231, 134, 83, 53),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x3600000F),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1545127398-14699f92334b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                  width: 100,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                                child: Text(
                                  'Alimentos',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(231, 134, 83, 53),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x3600000F),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                  width: 100,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                                child: Text(
                                  'Tienda',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(231, 134, 83, 53),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x3600000F),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1571782742478-0816a4773a10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTd8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                  width: 100,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                                child: Text(
                                  'Obiturio',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(231, 134, 83, 53),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x3600000F),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1539185441755-769473a23570?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODN8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                  width: 100,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                                child: Text(
                                  'Trasporte',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
