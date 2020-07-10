import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusa_web/Classes/Bachillerato/HomePageBa.dart';
import 'package:mansamusa_web/SelectionPage.dart';
import 'package:mansamusa_web/Users/bloc/bloc_user.dart';
import 'package:mansamusa_web/Users/ui/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return login(context);
        } else {
          return 
          SelectionPage(
            colorAppBar: Color(0xff002E62),
            colorBackground: Color(0xff002E62),
            logo: AssetImage("images/logowhite.png"),
            color: Colors.white,
          );
        }
      },
    );
  }

  Widget login(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
                image: AssetImage("images/WALL.jpg"), fit: BoxFit.cover)),
        child: Center(child: LoginForm()),
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
        ),
      ),
    ]);
  }
}
