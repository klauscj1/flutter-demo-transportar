import 'package:flutter/material.dart';
// import 'package:transporte_app/src/providers/global_provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transporte_app/src/widgets/opcion_menu.dart';

class ViajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final lista = [
      OpcionMenu(
        imagen: 'assets/images/conducir.png',
        titulo: 'Conductor',
        subtitulo: 'Crea un viaje y lleva a alguien más',
        url: 'nuevo-viaje',
      ),
      OpcionMenu(
        imagen: 'assets/images/pasajero.png',
        titulo: 'Pasajero',
        subtitulo: 'Forma parte de un viaje',
        url: 'nuevo-pasajero',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Viajar'),
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

  // _clicConductor(BuildContext context) {
  //   final bloc = Provider.getViajeBloc(context);
  //   bloc.changeViajeInterno(0);
  // }
}
