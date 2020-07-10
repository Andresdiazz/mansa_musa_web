import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentScrollInteres extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;

  ContentScrollInteres(
      {this.imageHeight,
      this.imageWidth,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: imageHeight,
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection('bachillerato')
                  .document('principal')
                  .collection('interes')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        /* Navigator.push(context, MaterialPageRoute(
                    builder: (_) => SecondPage(
                      id: doc.documentID,
                            title: doc.data['title'],
                            subtitle: doc.data['subtitle'],
                            description: doc.data['description'],
                            img:doc.data['img'],
                      )
                  ));*/
                      },
                      child: Container(
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
                          fit: BoxFit.cover,
                        )),
                      ),
                    );
                  },
                );
              },
            ))
      ],
    );
  }
}