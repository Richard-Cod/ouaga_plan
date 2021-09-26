import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/PlanListScreen/PlanListScreen.dart';

forgetPasswordButton({@required context}) {
  return FlatButton(
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => PlanListScreen()));
    },
    child: Text(
      'Mot de passe oublié',
      style: TextStyle(color: Colors.blue, fontSize: 15),
    ),
  );
}
