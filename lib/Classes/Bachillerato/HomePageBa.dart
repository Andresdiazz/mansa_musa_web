import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusa_web/Classes/Bachillerato/components/ContentScrollInteres.dart';
import 'package:mansamusa_web/Classes/Bachillerato/components/ContentScrollJugando.dart';
import 'package:mansamusa_web/Classes/Bachillerato/components/ContentScrollTematico.dart';
import 'package:mansamusa_web/Users/bloc/bloc_user.dart';
import 'package:mansamusa_web/Users/ui/screens/login_screen.dart';

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
                Icons.search,
                size: 28,
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
              child: IconButton(icon: Icon(Icons.home), onPressed: () {})),
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
              child: IconButton(icon: Icon(Icons.chat), onPressed: () {})),
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
              child: IconButton(icon: Icon(Icons.face), onPressed: () {})),
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
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ListView(children: [
          Container(
            width: double.infinity,
            height: 450,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/mansamusa-339c9.appspot.com/o/eje%20tematico%2FENTRADA-MANSA-MUNSA2.jpg?alt=media&token=8713a1ba-c207-4793-82ed-9d006471a5e5"),
                    fit: BoxFit.cover)),
          ),
          ContentScrollEje(
            imageHeight: 220.0,
            imageWidth: 320.0,
          ),
          Container(
            width: double.infinity,
            height: 450,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/mansamusa-339c9.appspot.com/o/temas%20interes%2FLOS-MOROS.jpg?alt=media&token=069bcebb-d3bc-476a-afba-1bb4d14d6301"),
                    fit: BoxFit.cover)),
          ),
          ContentScrollInteres(
            imageHeight: 220.0,
            imageWidth: 320.0,
          ),
          Container(
            width: double.infinity,
            height: 450,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/mansamusa-339c9.appspot.com/o/JUEGOS%2FENCUENTRA-EL-PAR.jpg?alt=media&token=30c0b9b2-7920-4189-a392-c55a3a5fed4e"),
                    fit: BoxFit.cover)),
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
