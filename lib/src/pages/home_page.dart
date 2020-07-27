import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:transporte_app/src/models/blocs/mapa_bloc.dart';
import 'package:transporte_app/src/providers/global_provider.dart';
import 'package:transporte_app/src/widgets/opcion_menu.dart';
import 'package:latlong/latlong.dart';

class HomePage extends StatelessWidget {
  void _getCurrentLocation(MapaBloc bloc) async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    bloc.changeCentro(LatLng(position.latitude, position.latitude));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = GlobalBloc.getMapaBloc(context);
    _getCurrentLocation(bloc);
    // final bloc = GlobalBloc.getViajeBloc(context);
    // bloc.changeCiudadDestino(Ciudad());
    // bloc.changeCiudadOrigen(Ciudad());
    final size = MediaQuery.of(context).size;
    final lista = [
      OpcionMenu(
        imagen: 'assets/images/carro.png',
        titulo: 'Viajar',
        subtitulo: 'Conduce o se un pasajero en el viaje de alguien más',
        url: 'viaje',
      ),
      OpcionMenu(
        imagen: 'assets/images/paquete.png',
        titulo: 'Envios',
        subtitulo: 'Envia o recibe paquetes de punto a punto',
        url: 'paquete',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ashish Rawat"),
              accountEmail: Text("ashishrawat2911@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Ttem 1"),
              trailing: FaIcon(FontAwesomeIcons.chevronRight),
            ),
            ListTile(
              title: Text("Item 2"),
              trailing: FaIcon(FontAwesomeIcons.chevronRight),
            ),
          ],
        ),
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
