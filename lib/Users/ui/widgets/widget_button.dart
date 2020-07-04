import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final VoidCallback _onPressed;
  String title;

  WidgetButton({Key key , VoidCallback onPressed, this.title})
      :_onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: _onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(title, style: TextStyle(color: Colors.white),),
    );

  }
}