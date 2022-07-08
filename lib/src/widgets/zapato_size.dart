import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {

  final bool? fullScreen;

  const ZapatoSizePreview({Key? key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding:  EdgeInsets.symmetric(
                                        horizontal: (fullScreen!) ? 5 : 30, 
                                        vertical:   (fullScreen!) ? 5 : 0,
                                      ),
        child: Container(
          width: double.infinity,
          //En el celular que me presto Santiago
          height: (fullScreen!) ? 380 : 400,
          //En tablet que me presto santiago
          //height: (fullScreen!) ? 600 : 620,
          
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: (fullScreen!)
            ? BorderRadius.circular(50)
            : const BorderRadius.only(
                               bottomLeft:  Radius.circular(50),
                               bottomRight: Radius.circular(50),
                               topLeft:     Radius.circular(40),
                               topRight:    Radius.circular(40)
                               ) 
          ),
          child: Column(
            children:[
    
              //Zapato con su sombra
              const _ZapatoConSombra(),
              //Tallas zapato
              if(!fullScreen!)
                 const _ZapatoTallas(),
    
            ],
          ),
        ),
      ),

      onTap: (){
        if(!fullScreen!){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const ZapatoDescPage())));
        }
      },

    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

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
          Image.asset(zapatoModel.getAssetImage)
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

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      child: Container(
        
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (numTalla == zapatoModel.getTalla)? const Color(0xffF1A23A):Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(numTalla == zapatoModel.getTalla)
                const BoxShadow(color: Color(0xffF1A23A),blurRadius: 10, offset: Offset(0, 5))
          ]
        ),
        child: Text(
          numTalla.toString().replaceAll('.0',''), 
          style:  TextStyle(
                            color: (numTalla == zapatoModel.getTalla)? Colors.white :const Color(0xffF1A23A),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                           ),
        ),
      ),

      onTap: (){
        //final zapatoModel = Provider.of<ZapatoModel>(context);
        zapatoModel.setTalla = numTalla;
      },

    );
  }
}