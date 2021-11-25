import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tacoModel with ChangeNotifier{
  int totalOrden=0;

  tacoModel(this.totalOrden);

  void add(bool up){
    if(up)
      totalOrden+=15;
    else
      totalOrden-=15;
    notifyListeners();
  }

  void reset(){
    totalOrden = 0;
  }
}