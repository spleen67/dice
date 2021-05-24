import 'dart:math';
//import 'De.dart';

class Lancement {
  int _rightDiceNumber;
  int _leftDiceNumber;
  int _total = 0;
  bool _paire = false;
  bool _resultat = false;

  int getRight() {
    return _rightDiceNumber = Random().nextInt(6) + 1;
  }

  int getleft() {
    return _leftDiceNumber = Random().nextInt(6) + 1;
  }

  int getResultat() {
    return _total;
  }

  void pairImpair() {
    _total = _rightDiceNumber + _leftDiceNumber;

    if ((_total % 2) == 0) {
      _paire = false;
    } else {
      _paire = true;
    }
  }

  bool getChoice(bool choice) {
    pairImpair();
    if ((choice && _paire) || (!choice && !_paire)) {
      // Si resultat OK, choix correspond a tirage

      _resultat = true;
      print(
          'Choix: $choice,  total : $_total, calcul res : $_paire, resutat : $_resultat');
    } else {
      // Si resultat POK, choix correspond pas au tirage
      _resultat = false;
      print(
          'Choix: $choice,  total : $_total, calcul res : $_paire, resutat : $_resultat');
    }

    return _resultat;
  }

  /* void hasard() {
    if ((isSwitched && checked) || (!isSwitched && !checked)) {
      // Si resultat OK, choix correspond a tirage
      face = true;
      ok = IconData(58080, fontFamily: 'MaterialIcons');
      couleurIcone = Colors.green;
    } else {
      // Si resultat POK, choix correspond pas au tirage
      face = false;
      ok = IconData(58079, fontFamily: 'MaterialIcons');
      couleurIcone = Colors.red.shade50;
    }
  } */
}
