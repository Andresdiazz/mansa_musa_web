import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusa_web/Classes/Bachillerato/components/Banner.dart';
import 'package:mansamusa_web/Classes/Bachillerato/components/BannerInteres.dart';
import 'package:mansamusa_web/Classes/Bachillerato/components/BannerJugando.dart';
import 'package:mansamusa_web/Classes/Bachillerato/components/ContentScrollInteres.dart';
import 'package:mansamusa_web/Classes/Bachillerato/components/ContentScrollJugando.dart';
import 'package:mansamusa_web/Classes/Bachillerato/components/ContentScrollTematico.dart';
import 'package:mansamusa_web/Users/bloc/bloc_user.dart';
import 'package:mansamusa_web/mansa_icon_icons.dart';

class HomePageBachillerato extends StatefulWidget {
  @override
  _HomePageBachilleratoState createState() => _HomePageBachilleratoState();
}

class _HomePageBachilleratoState extends State<HomePageBachillerato> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
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
              onPressed: () {}),
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
                  onPressed: () {})),
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
              child: IconButton(icon: Icon(MansaIcon.chat), onPressed: () {})),
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
              child:
                  IconButton(icon: Icon(MansaIcon.perfil), onPressed: () {})),
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                userBloc.signOut();
              })
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/WALL.jpg"), fit: BoxFit.cover)),
        child: ListView(children: [
          BannerPage(
            imageHeight: 450,
            imageWidth: 1400,
          ),
          ContentScrollEje(
            imageHeight: 220.0,
            imageWidth: 320.0,
          ),
          BannerInteres(
            imageHeight: 450,
            imageWidth: 1400,
          ),
          ContentScrollInteres(
            imageHeight: 220.0,
            imageWidth: 320.0,
          ),
          BannerJugando(
            imageHeight: 450,
            imageWidth: 1400,
          ),
          ContentScrollJugando(
            imageHeight: 220.0,
            imageWidth: 320.0,
          )
        ]),
      ),
    );
  }
}
