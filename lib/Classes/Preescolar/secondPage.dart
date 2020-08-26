import 'package:flutter/material.dart';
import 'package:mansamusa_web/Classes/Bachillerato/searchBachillerato.dart';

import '../../mansa_icon_icons.dart';
import 'components/tab_ejeTematico.dart';

class SecondPage extends StatefulWidget {
  final String id;

  final String title;
  final String img;
  final String description;
  final String subtitle;

  SecondPage({this.title, this.img, this.description, this.subtitle, this.id});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              "images/logowhite.png",
              width: 100,
            )),
        actions: [
          IconButton(
              icon: Icon(
                MansaIcon.search,
                size: 22,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchBachillerato()));
              }),
          Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue[500], Colors.blue[900]],
                      stops: [0.4, 0.5],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 2, color: Colors.white)),
              child: IconButton(
                  icon: Icon(
                    MansaIcon.home,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/HomePageBachillerato');
                  })),
          Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orange[500], Colors.orange[900]],
                      stops: [0.4, 0.5],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 2, color: Colors.white)),
              child: IconButton(
                  icon: Icon(MansaIcon.perfil),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  })),
        ],
      ),
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                //title: Text(widget.title.toUpperCase()),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                        onTap: () {
                          print("play buton");
                        },
                        child: Icon(
                          Icons.image_aspect_ratio,
                          size: 20,
                        )),
                  )
                ],
                expandedHeight: 450,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.img), fit: BoxFit.fill)),
                  child: Container(
                    color: Colors.black.withOpacity(.5),
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
                          "",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
              )
            ];
          },
          body: TabBarView(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/WALL.jpg"), fit: BoxFit.cover)),
              child: TabEjeWidget(
                id: widget.id,
                title: widget.title,
                description: widget.description,
                subtitle: widget.subtitle,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
