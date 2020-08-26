import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../gamePage.dart';
import '../thirdPage.dart';

class BannerInteres extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;

  BannerInteres({
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: imageHeight,
        child: StreamBuilder(
          stream: Firestore.instance
              .collection('bachillerato')
              .document('principal')
              .collection('BannerInteres')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text(
                "loading....",
                style: TextStyle(color: Colors.white),
              );
            }
            int length = snapshot.data.documents.length;

            return ListView.builder(
              //padding: EdgeInsets.symmetric(horizontal: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: length,
              itemBuilder: (_, int index) {
                //Portada port = portada[index];
                final DocumentSnapshot doc = snapshot.data.documents[index];
                return InkWell(
                  onTap: () {
                    print(doc.documentID);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ThirdPage(
                                  id: doc.documentID,
                                  title: doc.data['title'],
                                  description: doc.data['description'],
                                  img: doc.data['img'],
                                )));
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          //horizontal: 10.0,
                          vertical: 1.0,
                        ),
                        width: imageWidth,
                        height: imageHeight,
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                            //borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                          //"https://firebasestorage.googleapis.com/v0/b/mansamusa-339c9.appspot.com/o/eje%20tematico%2FENTRADA-MANSA-MUNSA2.jpg?alt=media&token=8713a1ba-c207-4793-82ed-9d006471a5e5",
                          doc.data['img'],
                          fit: BoxFit.fill,
                        )),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 450,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black45,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 220,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.orange[400],
                                            Colors.orange[900]
                                          ]),
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0.0, 7.0),
                                              blurRadius: 6.0,
                                            ),
                                          ]),
                                      child: Center(
                                        child: Text(
                                          "INGRESA",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 23),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      width: 400,
                                      child: Text(
                                        "Este juego es una excelente herramienta para trabajar la memoria, motricidad fina y la capacidad de análisis de los niños y niñas, buscamos mejorar su nivel de memoria y observación mientras se divierten.",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
