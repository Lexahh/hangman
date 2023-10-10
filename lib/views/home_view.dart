import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/views/game_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hangman")),
      body: Center(
          child: CupertinoButton.filled(
        child: Text("Start game"),
        onPressed: () {
          Get.to(
            () => GameView(),
            transition: Transition.cupertino,
          );
        },
      )),
    );
  }
}
