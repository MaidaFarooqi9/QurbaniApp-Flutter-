import 'package:flutter/material.dart';
class buyer extends StatefulWidget {
  @override
  _buyerState createState() => _buyerState();
}

class _buyerState extends State<buyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(

        children: <Widget>[
          FlatButton(child: Text('cow'),onPressed: (){Navigator.pushNamed(context, '/cow');},),
          FlatButton(child: Text('goat'),onPressed: (){Navigator.pushNamed(context, '/goat');},),
        ],
      )

    );
  }
}
