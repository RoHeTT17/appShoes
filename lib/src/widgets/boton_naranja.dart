import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  
  final String labelBoton;
  
  const BotonNaranja({Key? key, required this.labelBoton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.orange
      ),
      child: Text(labelBoton,style: const TextStyle(color: Colors.white,)),
    );
  }
}