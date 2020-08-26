import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ContentScrollInteres.dart';
import 'ContentScrollJugando.dart';

class TabDescriptionWidget extends StatefulWidget {
  final String title;
  final String description;

  TabDescriptionWidget({Key key, this.title, this.description});

  @override
  _TabDescriptionWidgetState createState() => _TabDescriptionWidgetState();
}

class _TabDescriptionWidgetState extends State<TabDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 20, right: 10),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RaisedButton(
            onPressed: () {
              print("play video");
              launch(
                  "https://firebasestorage.googleapis.com/v0/b/mansamusa-339c9.appspot.com/o/videoplayback.mp4?alt=media&token=5e2e4db5-17a8-480c-8753-6b1de98725b9");
            },
            child: Text(
              "Reproducir video",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: Colors.deepOrangeAccent,
          ),
        ),
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
