import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/game_view_controller.dart';

class GameView extends StatelessWidget {
  GameViewController controller = Get.put(GameViewController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameViewController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Hangman"),
          ),
          body: Column(children: [
            Image.asset("images/${controller.hibakSzama()}.png"),
            Text(controller.randomSzoveg),
            Text(controller.csillagosSzoveg),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LetterButton(letter: "A", controller: controller),
                    LetterButton(letter: "Á",controller: controller),
                    LetterButton(letter: "B",controller: controller),
                    LetterButton(letter: "C",controller: controller),
                    LetterButton(letter: "D",controller: controller),
                    LetterButton(letter: "E",controller: controller),
                  ],
                )
              ],
            )
          ]),
        );
      },
    );
  }
}

class LetterButton extends StatelessWidget {
  const LetterButton({
  required this.letter,
    required this.controller,
  });

  final GameViewController controller;
  final  String letter;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      padding: EdgeInsets.zero,
      child: Text(letter),
       onPressed: (controller.aMegadottBetuVoltMar(letter)) 
       ? null 
       : ()=>controller.tippHozzaadasa(letter),
              
    );
  }
}
