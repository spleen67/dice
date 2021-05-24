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
      color: Colors.red.shade50,
      size: 200,
    ),
  ];

  Icon getIcon(bool res) {
    return (res ? _iconeRes[0] : _iconeRes[1]);
  }
}
