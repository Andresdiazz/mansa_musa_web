import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mansamusa_web/Games/par/parPage.dart';
import 'package:mansamusa_web/Games/trivia/quizpage.dart';

import 'ContentScrollInteres.dart';
import 'ContentScrollJugando.dart';
import 'ContentScrollTematico.dart';

class TabGameWidget extends StatefulWidget {
  final String title;
  final String description;
  final int id;

  TabGameWidget({Key key, this.title, this.description, this.id});

  @override
  _TabGameWidgetState createState() => _TabGameWidgetState();
}

class _TabGameWidgetState extends State<TabGameWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 20, right: 10),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AutoSizeText(
                widget.title,
                style: TextStyle(fontSize: 30, color: Colors.white),
                maxFontSize: 30,
                minFontSize: 20,
                maxLines: 2,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
                    height: 1.5,
                    decoration: BoxDecoration(color: Colors.white)))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RaisedButton(
            onPressed: () {
              switch (widget.id) {
                case 1:
                  print(widget.id);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ParPage()));
                  break;
                case 2:
                  print(widget.id);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => getjson()));
                  break;
              }
            },
            child: Text(
              "Entra y Juega",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: Colors.deepOrangeAccent,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ContentScrollJugando(
          imageHeight: 220.0,
          imageWidth: 320.0,
        ),
        SizedBox(height: 10.0),
        ContentScrollEje(
          imageHeight: 220.0,
          imageWidth: 320.0,
        ),
        SizedBox(height: 10.0),
        ContentScrollInteres(
          imageHeight: 220.0,
          imageWidth: 320.0,
        ),
      ],
    );
  }
}
