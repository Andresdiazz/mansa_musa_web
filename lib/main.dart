
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusa_web/Classes/Bachillerato/HomePageBa.dart';
import 'package:mansamusa_web/SelectionPage.dart';
import 'package:mansamusa_web/Users/bloc/bloc_user.dart';

import 'Users/ui/screens/login_screen.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Mansa Musa',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xff002E62),
          accentColor: Color(0xff000914),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new SelectionPage(
            colorAppBar: Color(0xff002E62),
            colorBackground: Color(0xff002E62),
            logo: AssetImage("images/logowhite.png"),
            color: Colors.white,
          ),
          //'/HomePagePreescolar' : (BuildContext context) => new NavigationBarPreescolar(),
          //'/HomePagePrimaria' : (BuildContext context) => new NavigationBarPrimaria(),
          '/HomePageBachillerato' : (BuildContext context) => HomePageBachillerato(),

        },
      ),
      bloc: UserBloc(),
    );
  }
}
