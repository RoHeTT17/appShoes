import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';


class ZapatoDescPage extends StatelessWidget {
 
  const ZapatoDescPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {

    cambiarStatusLigth(); 

    return Scaffold(
      body: Column(
        children: [

          Stack(
                children: [

                            const Hero(
                                 tag: 'zapato-1',
                                 child: ZapatoSizePreview( fullScreen: true),
                                ),

                            Positioned(
                              top: 80,
                              child: FloatingActionButton(
                                                          elevation: 0,
                                                          highlightElevation: 0,
                                                          backgroundColor: Colors.transparent,
                                                          onPressed: () { 
                                                            cambiarStatusDark(); 
                                                            Navigator.pop(context);
                                                           },

                                                          child: const Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                                                        )
                            )
                          ],
              ),
         
          Expanded(
            child: SingleChildScrollView(
                    child: Column(
                      children: const [
                                        ZapatoDescripcion(
                                          titulo: 'Nike Air Max 720',
                                          descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                                        ),

                                        _MontoBuyNow(),
                                        _ColoresYmas(),
                                        _BotonesLikeCartSettings()

                                      ],
                      ),
                  )
          )
        
        ],
      )
   );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            children:  [
                        const Text('\$100.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Bounce(
                              delay: const Duration(seconds: 1),
                              from: 8,
                              child: const BotonNaranja(labelBoton: 'Buy now', ancho: 120, alto: 40)
                              )
                       ],
          ),

      ),
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  const _ColoresYmas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children:  [
                    Expanded(
                      child: Stack(
                                    children: const [
                                                      Positioned(left: 90,child: _BotonColor(Color(0xff364D56),1,'assets/img/negro.png')),
                                                      Positioned(left: 60,child: _BotonColor(Color(0xff2099F1),2,'assets/img/azul.png')),
                                                      Positioned(left: 30,child: _BotonColor(Color(0xffFFAD29),3,'assets/img/amarillo.png')),
                                                      _BotonColor(Color(0xffC6D642),4,'assets/img/verde.png'),
                                                    ],
                                  )
                    ),

                    //const Spacer(),

                    const BotonNaranja(labelBoton: 'More related items', alto: 30, ancho: 140, colorBoton: Color(0xffFFC675),)
                   ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {

  final Color colorBoton;
  final int index;
  final String urlImg;

  const _BotonColor(this.colorBoton, this.index, this.urlImg);

  @override
  Widget build(BuildContext context) {

    final zapatoProvider = Provider.of<ZapatoModel>(context);

    return FadeInLeft(
      delay: Duration(milliseconds: index * 200),
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: colorBoton,
            shape: BoxShape.circle
          ),
        ),

        onTap: (){
            zapatoProvider.setAssetImage = urlImg;
        },  

      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(Icon(Icons.star, color: Colors.pink,size: 25,)),
          _BotonSombreado(Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4),size: 25,)),
          _BotonSombreado(Icon(Icons.settings, color: Colors.grey.withOpacity(0.4),size: 25,)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {

  final Icon iconButton;

  const _BotonSombreado(this.iconButton,);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  55,
      height: 55,
      decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10)
                                            )
                                          ]
                              ),

      child: iconButton,
    );
  }
}