import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transporte_app/src/widgets/opcion_menu.dart';

class PaquetePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final lista = [
      OpcionMenu(
        imagen: 'assets/images/entregar.png',
        titulo: 'Entregar',
        subtitulo: 'Recoge, transporta y  entrega paquetes de un sitio a otro',
        url: 'viaje',
      ),
      OpcionMenu(
        imagen: 'assets/images/recibir.png',
        titulo: 'Recibir',
        subtitulo: 'Pide un transporte para tu paquete',
        url: '',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Paquete'),
      ),
      body: (size.width > 500)
          ? Row(
              children: lista,
            )
          : Column(
              children: lista,
            ),
    );
  }
}
