import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mansamusa_web/Classes/Bachillerato/HomePageBa.dart';
import 'package:mansamusa_web/Classes/Bachillerato/thirdPage.dart';

import 'components/searchService.dart';

class SearchBachillerato extends StatefulWidget {
  @override
  _SearchBachilleratoState createState() => _SearchBachilleratoState();
}

class _SearchBachilleratoState extends State<SearchBachillerato> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
      SearchService().searchByName2(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
      SearchService().searchByName3(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['title'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  final myController = TextEditingController();

  clearTextInput() {
    myController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Theme.of(context).primaryColor,
        body: Container(
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/WALL.jpg"), fit: BoxFit.cover)),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: TextFormField(
                controller: myController,
                onChanged: (val) {
                  initiateSearch(val);
                },
                enabled: true,
                style: TextStyle(color: Colors.white70, fontSize: 15),
                decoration: InputDecoration(
                    labelText: "¿Qué estas buscando?",
                    filled: true,
                    fillColor: Theme.of(context).primaryColor,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white38,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white38,
                      ),
                      onPressed: () {
                        clearTextInput();
                      },
                    ),
                    labelStyle: TextStyle(color: Colors.white38, fontSize: 12),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              elevation: 0,
              actions: [
                FlatButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      clearTextInput();
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageBachillerato()));
                    },
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GridView.count(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            primary: false,
            shrinkWrap: true,
            children: tempSearchStore.map((element) {
              return buildResultCard(element, context);
            }).toList(),
          )
        ],
      ),
    ));
  }
}

Widget buildResultCard(data, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ThirdPage(
                    title: data['title'],
                    description: data['description'],
                    img: data['img'],
                  )));
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                image: NetworkImage(data['img']), fit: BoxFit.fill)),
      ),
    ),
  );
}
