import 'package:flutter/material.dart';
import 'dart:math';

// ignore: must_be_immutable
class DicePage extends StatefulWidget {
  int test = 0;
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 0;
  int rightDiceNumber = 0;
  bool isSwitched = false, checked = false, face = false, reinit = false;
  int restDiv = 0;
  int total = 0;
  IconData ok = IconData(58080, fontFamily: 'MaterialIcons'); //mood_bad_rounded
  Color couleurIcone = Colors.red;

  void hasard() {
    setState(
      () {
        checked = false; // paire
        rightDiceNumber = Random().nextInt(6) + 1;
        leftDiceNumber = Random().nextInt(6) + 1;
        total = rightDiceNumber + leftDiceNumber;
        restDiv = total % 2;
        if (restDiv != 0) {
          checked = true;
          // resultat paire
        }
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /* SizedBox(
                  height: 100.0,
                ), */
                Text(
                  'Paire',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Colors.yellow,
                  activeColor: Colors.orangeAccent,
                ),
                Text(
                  'Impaire',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    hasard();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    hasard();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text('Total = $total'),
          Text(checked ? "Impaire" : "Paire"),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                  child: Icon(ok,
                      size: 200, color: couleurIcone) //Icon(face ? ok : pok),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
