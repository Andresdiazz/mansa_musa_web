import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusa_web/Users/ui/screens/login_screen.dart';

import 'Users/bloc/bloc_user.dart';

class SelectionPage extends StatefulWidget {
  final Color colorAppBar;
  final Color colorBackground;
  final AssetImage logo;
  final Color color;

  SelectionPage(
      {Key key, this.color, this.colorBackground, this.colorAppBar, this.logo});

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                image: DecorationImage(
                    image: AssetImage("images/WALL.jpg"), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 50,
            child: AppBar(
              title: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "images/logowhite.png",
                    width: 120,
                  )),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: widget.color,
                  ),
                  onPressed: () {
                    userBloc.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                )
              ],
            ),
          ),
          Container(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¡Dinos que quieres aprender!",
                      style: TextStyle(
                        fontSize: 40,
                        color: widget.color,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                /*Navigator.of(context).pushReplacementNamed(
                                    '/HomePagePreescolar');*/
                              },
                              child: Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: AssetImage("images/img/3.png"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Text(
                              "Preescolar",
                              style: TextStyle(
                                  color: widget.color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                /*Navigator.of(context)
                                    .pushReplacementNamed('/HomePagePrimaria');*/
                              },
                              child: Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image:
                                            AssetImage("images/img/GIRL.png"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Text(
                              "Primaria",
                              style: TextStyle(
                                  color: widget.color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/HomePageBachillerato');
                          },
                          child: Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage("images/img/KID.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Text(
                          "Bachillerato",
                          style: TextStyle(
                              color: widget.color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
