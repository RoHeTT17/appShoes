import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/pages/zapato_page.dart';

void main() => runApp(
  
  
  MultiProvider(
    providers: [
                ChangeNotifierProvider<ZapatoModel>(create: (_) => new ZapatoModel())
               ],
              
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes APP',
      home: ZapatoPage(),
    );
  }
}