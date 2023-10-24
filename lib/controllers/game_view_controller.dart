// játék logika
import 'dart:math';
import 'package:get/get.dart';
import 'package:hangman/models/tipp.dart';
import 'package:hangman/views/end_view.dart';

class GameViewController extends GetxController {
  List<String> szovegek = [
    "alma piros",
    "az ég kék",
    "gurul a szekér",
  ];

  String randomSzoveg = "";

  String csillagosSzoveg = "";

  void randomSzovegGeneralasa() {
    int index = Random().nextInt(szovegek.length);
    randomSzoveg = szovegek[index];
    csillagosSzoveg = "";
    for (int i = 0; i < randomSzoveg.length; i++) {
      csillagosSzoveg += "*";
    }
    update();
  }

  List<Tipp> tippek = [];

  bool nyertEaFelhasznalo() {
    return csillagosSzoveg == randomSzoveg;
  }

  bool vesztettEaFelhasznalo() {
    int szamlalo = 0;
    for (int i = 0; i < tippek.length; i++) {
      if (tippek[i].talaltE == false) {
        szamlalo++;
      }
    }
    if (szamlalo == 6)
      return true;
    else
      return false;
  }
  int hibakSzama() {
    int szamlalo = 0;
    for (int i = 0; i < tippek.length; i++) {
      if (tippek[i].talaltE == false) {
        szamlalo++;
      }
    }
   return szamlalo;
  }

  bool aMegadottBetuVoltMar(String betu) {
    bool tartalmazza = false;
    for (int i = 0; i < tippek.length; i++) {
      if (tippek[i].karakter == betu) {
        tartalmazza= true;
        break;
      }
    }
   return tartalmazza;
  }


  void tippHozzaadasa(String betu) {
    if (randomSzoveg.toLowerCase().contains(betu.toLowerCase())) {
      List<String> csillagosSzovegTemp = csillagosSzoveg.split('');
      for (int i = 0; i < randomSzoveg.length; i++) {
        if (randomSzoveg[i] == betu) {
          csillagosSzovegTemp[i] = betu;
        }
      }
      csillagosSzoveg = csillagosSzovegTemp.join();
      tippek.add(Tipp(
        karakter: betu,
        talaltE: true,
      ));update();
      if (nyertEaFelhasznalo()){
        Get.to(EndView("gratulalok nyertel", hibakSzama()));
      }
    } else {
      tippek.add(Tipp(
        karakter: betu,
        talaltE: false,
      ));
    }
    update();
    if (vesztettEaFelhasznalo())
    {
      Get.to(EndView("Vesztettel, amire gondoltam: ${randomSzoveg}", hibakSzama()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    randomSzovegGeneralasa();
    update();
  }
}
