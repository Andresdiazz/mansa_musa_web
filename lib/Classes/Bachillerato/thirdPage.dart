import 'package:flutter/material.dart';

import 'components/tab_description.dart';

class ThirdPage extends StatefulWidget {
  final String id;
  final String title;
  final String img;
  final String description;

  const ThirdPage({Key key, this.title, this.img, this.description, this.id})
      : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                //title: Text(widget.title),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                        onTap: () {
                          print("play buton");
                        },
                        child: Icon(
                          Icons.play_circle_outline,
                          size: 30,
                        )),
                  )
                ],
                expandedHeight: 450,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.img), fit: BoxFit.cover)),
                  child: Container(
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
                pinned: true,
                bottom: TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Color(0xffAC7830),
                    indicatorWeight: 3,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          "Descripción",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Clase",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Actividad",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              )
            ];
          },
          body: TabBarView(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/WALL.jpg"), fit: BoxFit.cover)),
              child: TabDescriptionWidget(
                title: widget.title,
                description: widget.description,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/WALL.jpg"), fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/WALL.jpg"), fit: BoxFit.cover)),
            )
          ]),
        ),
      ),
    );
  }
}
