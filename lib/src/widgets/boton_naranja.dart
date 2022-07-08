import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  
  final String  labelBoton;
  final double? alto;
  final double? ancho;
  final Color?  colorBoton;

  const BotonNaranja({
    
    Key? key, 
    required this.labelBoton, 
    this.alto = 50, 
    this.ancho = 150, 
    this.colorBoton = Colors.orange
    
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho,
      height: alto,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: colorBoton
      ),
      child: Text(labelBoton,style: const TextStyle(color: Colors.white,)),
    );
  }
}