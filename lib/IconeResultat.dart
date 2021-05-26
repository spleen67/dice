import 'package:flutter/material.dart';

class IconeResultat {
  int _appel = 0;

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
      'images/rejete.png',
      width: 150,
      height: 150,
    ),
    Image.asset(
      'images/approuve.png',
      width: 150,
      height: 150,
    ),
  ];

  void defaut() {}

  Icon getIcon(bool res) {
    if (_appel == 0) {
      _appel++;
      return _iconeRes[2];
    } else {
      return (res ? _iconeRes[0] : _iconeRes[1]);
    }
  }

  Image getImage(bool res) {
    if (_appel == 0) {
      _appel++;
      return _imageResultat[1];
    } else {
      return (res ? _imageResultat[1] : _imageResultat[0]);
    }
  }
}
