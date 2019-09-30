
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _msgFinal = "";
  var _color = Colors.transparent;


  opcaoSelect(int choice){

     var number = Random().nextInt(3);
     final _venceu = "Você venceu!";
     final _perdeu = "Você perdeu  :(";


     switch(number){
       case 0:
         setState(() {
           _imagemApp = AssetImage("images/papel.png");
         });
         break;

       //PEDRA
       case 1:
         setState(() {
           _imagemApp = AssetImage("images/pedra.png");
         });
         break;


         //TESOURA
       case 2:
         setState(() {
           _imagemApp = AssetImage("images/tesoura.png");
         });
         break;
     }

    if(choice == number){
      setState(() {
        _msgFinal = "Empatou";
        _color = Colors.teal;
      });
    }else if(choice<2 && (choice+1 ==  number)){
      setState(() {
        _msgFinal = _venceu;
        _color = Colors.green;
      });
    }else if(choice==2 && (0 == number)){
      setState(() {
        _msgFinal = _venceu;
        _color = Colors.green;
      });
    }else{
      setState(() {
        _msgFinal = _perdeu;
        _color = Colors.redAccent;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.teal,
      ) ,
      body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             Padding(
               padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
               child:  Text("Faça sua Jogada:",
                 style: TextStyle(
                     fontSize: 20
                 ),),
             ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => opcaoSelect(0),
                    child: Image.asset("images/papel.png", height: 95,)
                  ),
                  GestureDetector(
                      onTap: () => opcaoSelect(1),
                      child: Image.asset("images/pedra.png",height: 95,),
                  ),
                  GestureDetector(
                      onTap: () => opcaoSelect(2),
                      child: Image.asset("images/tesoura.png", height: 95,)
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 15),
                child:  Text("Adversario:",
                  style: TextStyle(
                      fontSize: 20
                  ),),
              ),
              //image
              GestureDetector(
                child: Image(image: this._imagemApp,),
                onLongPress: (){
                  Fluttertoast.showToast(
                      msg: "Começando novo Jogo",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.teal,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.all(30),
                color: this._color,
                child: Text(this._msgFinal,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),),
              )
            ],
          ),
    );
  }
}
