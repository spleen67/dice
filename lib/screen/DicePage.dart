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
  int checked = 3;

  _reinit() {
    setState(() {
      leftDiceNumber = 0;
      rightDiceNumber = 0;
      isSwitched = false;
      resultat = 0;
      checked = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /* SizedBox(
                    height: 100.0,
                ), */
                        Text(
                          'Paire',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
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
            height: 20,
          ),

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
          SizedBox(
            height: 50,
          ),

          Container(
            child: Stack(
              children: [
                Container(
                  height: 177,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total = $resultat'),
                      FlatButton.icon(
                        icon: Icon(Icons.file_upload),
                        label: Text("Reinitialiser"),
                        onPressed: () {
                          _reinit();
                        },
                        color: Colors.red,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
