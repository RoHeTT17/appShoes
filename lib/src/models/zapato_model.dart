import 'package:flutter/material.dart';


class ZapatoModel with ChangeNotifier{

    String _assetImage = 'assets/img/azul.png';
    double _talla = 9.0;
    
    String get getAssetImage => this._assetImage;

    set setAssetImage(String assetImage) {
      this._assetImage = assetImage;
      notifyListeners();
    }

    double get getTalla => this._talla;

    set setTalla(double talla){
      this._talla = talla;
      notifyListeners();
   }

}