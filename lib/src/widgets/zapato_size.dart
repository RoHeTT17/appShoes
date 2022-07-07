import 'package:flutter/material.dart';

class ZapatoSizePreview extends StatelessWidget {
  const ZapatoSizePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50) 
        ),
        child: Column(
          children: const [

            //Zapato con su sombra
            _ZapatoConSombra(),
            //Tallas zapato
            _ZapatoTallas(),

          ],
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [

          const Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra()
          ),

          //Image(image: AssetImage('assets/img/azul.png'),)
          Image.asset('assets/img/azul.png')
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 190,
        height: 100,
        decoration: BoxDecoration(
          //color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
             BoxShadow(
                color: Color(0xffEAA14E), blurRadius: 40
            ),
          ]
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {

  final double numTalla;

  const _TallaZapatoCaja(this.numTalla); 

  @override
  Widget build(BuildContext context) {
    return Container(
      
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: (numTalla == 9)? const Color(0xffF1A23A):Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if(numTalla == 9)
              const BoxShadow(color: Color(0xffF1A23A),blurRadius: 10, offset: Offset(0, 5))
        ]
      ),
      child: Text(
        numTalla.toString().replaceAll('.0',''), 
        style:  TextStyle(
                          color: (numTalla == 9)? Colors.white :const Color(0xffF1A23A),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                         ),
      ),
    );
  }
}