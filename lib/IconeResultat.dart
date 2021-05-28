import 'package:flutter/material.dart';

class IconeResultat {
  List<Icon> _iconeRes = [
    Icon(
      Icons.check,
      color: Colors.green,
      size: 200,
    ),
    Icon(
      Icons.close,
      color: Colors.red.shade50,
      size: 200,
    ),
    Icon(
      Icons.indeterminate_check_box_outlined,
      color: Colors.red,
      size: 200,
    ),
  ];

  List<Image> _imageResultat = [
    Image.asset(
      'images/approuve.png',
      width: 150,
      height: 150,
    ),
    Image.asset(
      'images/rejete.png',
      width: 150,
      height: 150,
    ),
    Image.asset(
      'images/vide.png',
      width: 150,
      height: 150,
    ),
  ];

  void defaut() {}

  Icon getIcon(int res) {
    if (res == 3) {
      return _iconeRes[2];
    } else {
      return ((res == 0) ? _iconeRes[0] : _iconeRes[1]);
    }
  }

  Image getImage(int res) {
    if (res == 3) {
      return _imageResultat[2];
    } else {
      return ((res == 0) ? _imageResultat[0] : _imageResultat[1]);
    }
  }
}
