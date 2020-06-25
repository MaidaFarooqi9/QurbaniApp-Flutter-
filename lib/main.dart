import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mandi/goat.dart';
import 'package:mandi/login.dart';
import 'package:mandi/registration.dart';
import 'package:mandi/buyerPage.dart';
import 'cow.dart';

void main() => runApp(MaterialApp(//home:MyApp()
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/login': (context) => Login(),
      '/signup':(context)=>SignUp(),
      '/BuyerPage':(context)=>buyer(),
      '/cow':(context)=>cow(),
      '/goat':(context)=>goat(),
    }


));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar:AppBar(title:Text('Mandi'),backgroundColor:Colors.teal,) ,

      body:Container(
        /*decoration:BoxDecoration(
    image:DecorationImage(image: AssetImage
      ("images/bg.png"),
      fit:BoxFit.cover,
    ),
    ),*/
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(136.0),
              child:Image.asset('images/cow.png',height:95.0,width:85.0,),),

            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (rect) {
                return LinearGradient(

                  colors:<Color>[Colors.green, Colors.red],
                  tileMode: TileMode.mirror,
                ).createShader(rect);
              },
              child: Center(child: const Text('Who are you?',style: TextStyle(fontSize: 28,fontWeight:FontWeight.bold),)),
            ),

            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (rect) {
                return LinearGradient(
                  colors:[Colors.red, Colors.pink.shade900],
                  tileMode: TileMode.mirror,
                ).createShader(rect);
              },
              child:  FlatButton(onPressed:(){Navigator.pushNamed(context, '/BuyerPage');},child:Text('A Buyer',style: TextStyle(fontSize: 27,fontWeight:FontWeight.bold),),),
            ),

            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (rect) {
                return LinearGradient(
                  colors:[Colors.red, Colors.pink.shade900],
                  tileMode: TileMode.mirror,
                ).createShader(rect);
              },
              child:  FlatButton(onPressed:(){Navigator.pushNamed(context, '/login');},
                child:Text('A Seller',style: TextStyle(fontSize: 27,fontWeight:FontWeight.bold),),),
            ),






          ],
        ),
      ),



    );
  }
}