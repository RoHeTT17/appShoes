import 'package:flutter/material.dart';

import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatoPage extends StatelessWidget {
 
  const ZapatoPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {


     cambiarStatusDark(); 

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(labelSearch: 'For you',),
          const SizedBox(height: 20,),

          //Se pone un expanded para que tome todo el espacio posible. Al SingleChildScrollView, se le debe
          //definir el tamaño, por eso es que se pone.
          Expanded(child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children:  const [
                                          Hero(
                                               tag: 'zapato-1',
                                               child: ZapatoSizePreview()
                                              ),
                                          //SizedBox(height: 20,),  

                                          ZapatoDescripcion(
                                            titulo: 'Nike Air Max 720',
                                            descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                                          ),   
                                        ],
                            ),
                         )      
          ),
          const AgregarCarritoBoton(monto: 100.0),

        ],
      ) 
   );
  }
}