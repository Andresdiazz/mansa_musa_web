import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'ContentScrollInteres.dart';
import 'ContentScrollJugando.dart';
import 'content_scrollRelacionados.dart';

class TabEjeWidget extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String subtitle;

  //CardsPrincipal cards;

  TabEjeWidget({Key key, this.title, this.description, this.subtitle, this.id});

  @override
  _TabEjeWidgetState createState() => _TabEjeWidgetState();
}

class _TabEjeWidgetState extends State<TabEjeWidget> {
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
                maxLines: 2,
                minFontSize: 15,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
              height: 1.5,
              decoration: BoxDecoration(color: Colors.white),
            ))
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
        ContentScrollRelacionTematico(
          //images: temasInteresList,
          id: widget.id,
          title: widget.subtitle,
          imageHeight: 140.0,
          imageWidth: 183.0,
          padding: 10,
          paddingContainer: 0,
        ),
        ContentScrollInteres(
          imageHeight: 220.0,
          imageWidth: 320.0,
        ),
        ContentScrollJugando(
          imageHeight: 220.0,
          imageWidth: 320.0,
        )
      ],
    );
  }
}
