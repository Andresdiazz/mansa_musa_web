import 'package:flutter/material.dart';
import 'package:mansamusa_web/Users/ui/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
                image: AssetImage("images/WALL.jpg"), fit: BoxFit.cover)),
        child: Center(child: RegisterForm()),
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
