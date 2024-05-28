import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [//lista de colores
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme{
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    }): assert(selectedColor >= 0 && selectedColor <= _colorThemes.length -1 , 'Colors must be between 0 and ${_colorThemes.length}');//esta es una condicion

  ThemeData theme(){
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}
//esta clase es para el tema que se quiere utilizar 