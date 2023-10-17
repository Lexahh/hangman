// játék logika
import 'dart:math';
import 'package:get/get.dart';
import 'package:hangman/models/tipp.dart';

class GameViewController extends GetxController {
  List<String> szovegek = [
    "alma piros", 
    "az ég kék", 
    "gurul a szekér"];

  String randomSzoveg = "";

  String csillagosSzoveg = "";

  void randomSzovegGeneralasa() {
    int index = Random().nextInt(szovegek.length);
    randomSzoveg = szovegek[index];
    csillagosSzoveg = "";
    for (int i = 0; i<randomSzoveg.length; i++) {
      csillagosSzoveg += "*";
    }
  }
List<Tipp> tippek = [];

bool nyertEaFelhasznalo(){
  return csillagosSzoveg==randomSzoveg;
}


 @override
 void onInit(){
  super.onInit();
  randomSzovegGeneralasa();
  update();
 }
}
