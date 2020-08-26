import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../relacionadosPage.dart';

class ContentScrollRelacionTematico extends StatelessWidget {
  final String id;
  final String title;
  final double imageHeight;
  final double imageWidth;
  final double padding;
  final double paddingContainer;

  ContentScrollRelacionTematico(
      {this.id,
      this.title,
      this.imageHeight,
      this.imageWidth,
      this.padding,
      this.paddingContainer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: padding),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 1.5,
                decoration: BoxDecoration(color: Colors.white),
              )),
            ],
          ),
        ),
        Container(
            height: imageHeight,
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection('bachillerato')
                    .document('principal')
                    .collection('tematico')
                    .document(id)
                    .collection('relacionTematico')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Text("loading....");
                  }
                  int length = snapshot.data.documents.length;

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: length,
                    itemBuilder: (_, int index) {
                      //Portada port = portada[index];
                      final DocumentSnapshot doc =
                          snapshot.data.documents[index];
                      return InkWell(
                        onTap: () {
                          print(doc.documentID);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => relacionadosPage(
                                        id: id,
                                        title: doc.data['title'],
                                        description: doc.data['description'],
                                        img: doc.data['img'],
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 20.0,
                          ),
                          width: imageWidth,
                          height: imageHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0.0, 4.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                //"https://firebasestorage.googleapis.com/v0/b/mansamusa-339c9.appspot.com/o/eje%20tematico%2FENTRADA-MANSA-MUNSA2.jpg?alt=media&token=8713a1ba-c207-4793-82ed-9d006471a5e5",
                                doc.data['img'],
                                fit: BoxFit.fill,
                              )),
                        ),
                      );
                    },
                  );
                }))
      ],
    );
  }
}
