import 'package:flutter/material.dart';
import 'package:toss/Lancement.dart';
import 'package:toss/IconeResultat.dart';

Lancement jet = Lancement();
IconeResultat iconeRes = IconeResultat();

// ignore: must_be_immutable
class DicePage extends StatefulWidget {
  int test = 0;
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 0;
  int rightDiceNumber = 0;
  int resultat = 0;
  bool isSwitched = false; // false = paire, true = impaire
  bool checked = false;

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
                      print('changement $isSwitched');
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
                    setState(() {
                      leftDiceNumber = jet.getleft();
                      rightDiceNumber = jet.getRight();
                      checked = jet.getChoice(isSwitched);
                      resultat = jet.getResultat();
                    });
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNumber = jet.getleft();
                      rightDiceNumber = jet.getRight();
                      checked = jet.getChoice(isSwitched);
                      resultat = jet.getResultat();
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text('Total = $resultat'),
          //Text(jet.getChoice(checked) ? "Impaire" : "Paire"),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: iconeRes.getImage(checked),
              ),
              //child: iconeRes.getIcon(checked),
              //Icon(face ? ok : pok),
            ],
          ),
        ],
      ),
    );
  }
}
