import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusa_web/Users/bloc/bloc_user.dart';
import 'package:mansamusa_web/Users/ui/screens/login_screen.dart';

import 'widget_button.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  String _errorMessage = "";

  bool showPassword = false;

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of( context );
    return Container(
      width: 350,
      height: 400,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Crea tu cuenta",
                    style: TextStyle(
                        fontSize: 22, color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                    decoration: InputDecoration(
                        labelText: "Email",
                        filled: true,
                        fillColor: Color(0xffE6E4E4),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xffBAB9B9),
                        ),
                        labelStyle:
                            TextStyle(color: Color(0xffBAB9B9), fontSize: 12),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    keyboardType: TextInputType.emailAddress,
                    //autovalidate: true,
                    autocorrect: false,
                    onSaved: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        labelText: 'Contraseña de 6 o más carácteres',
                        suffixIcon: IconButton(
                            icon: Icon(showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            }),
                        labelStyle:
                            TextStyle(color: Color(0xffBAB9B9), fontSize: 12),
                        filled: true,
                        fillColor: Color(0xffE6E4E4),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xffBAB9B9),
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    obscureText: !showPassword,

                    //autovalidate: true,
                    autocorrect: false,
                    onSaved: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RaisedButton(
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          textColor: Colors.white,
                          onPressed: () => _login(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Crear Cuenta"),
                              if (_loading)
                                Container(
                                  height: 20,
                                  width: 20,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  ),
                                )
                            ],
                          ),
                        ),
                        if (_errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              _errorMessage,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        
                        
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "¿Ya tienes una cuenta?",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            FlatButton(
                              child: Text(
                                'Inicia Sesión',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xffC48934)),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement( context , MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen()) );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    if (!_loading) {
      if (_formKey.currentState.validate( )) {
        _formKey.currentState.save( );
        setState( () {
          _loading = true;
          _errorMessage = "";
        } );
        try {
          var user = await userBloc.createAccountEmail(email, password);
          //Navigator.of(context).pop(context);
          //Navigator.of(context).pushReplacementNamed('/home');
          return user != null;
        }catch (e){
          setState(() {
            _loading = false;
            //_errorMessage = "Email o contraseña incorrecta";
          });
          return e.message;
        }
      }
    }
  }
}
