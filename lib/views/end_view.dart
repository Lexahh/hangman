import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/views/home_view.dart';

class EndView extends StatelessWidget {
  String uzenet;
  int index;
  EndView(this.uzenet, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/$index.jpg"),
            Text(
              uzenet,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton.filled(
              child: Text("Vissza a kezdőlapra"),
              onPressed: () {
                Get.offAll(HomeView());
              },
            )
          ],
        ),
      ),
    );
  }
}
