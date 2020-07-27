import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:transporte_app/src/models/blocs/mapa_bloc.dart';
import 'package:transporte_app/src/providers/global_provider.dart';

class Mapa extends StatelessWidget {
  Future<LatLng> _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('posicion actual');
    return LatLng(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final MapaBloc bloc = GlobalBloc.getMapaBloc(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              bloc.mapaController
                  .move(await _getCurrentLocation(), bloc.mapaController.zoom);
            },
            child: Icon(
              FontAwesomeIcons.circle,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: _cuerpo(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var newZoom = bloc.mapaController.zoom + 1;
          bloc.mapaController.move(bloc.mapaController.center, newZoom);
          // bloc.mapaController.
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }

  Widget _cuerpo(BuildContext context) {
    final bloc = GlobalBloc.getMapaBloc(context);
    return StreamBuilder(
      stream: bloc.mapaControllerStream,
      builder: (BuildContext context, AsyncSnapshot<MapController> snapshot) {
        if (snapshot.hasData) {
          MapController _mapController = snapshot.data;
          return new FlutterMap(
            mapController: _mapController,
            options: new MapOptions(
              center: new LatLng(-2.9727186462753767, -78.92406306063633),
              zoom: 13.0,
            ),
            layers: [
              new TileLayerOptions(
                  // urlTemplate: "https://api.tiles.mapbox.com/v4/"
                  //     "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                  // additionalOptions: {
                  //   'accessToken':
                  //       'pk.eyJ1Ijoia2xhdXNjaiIsImEiOiJjanhjamVxcTIwNDE5M29sYjVxZ29lb2pnIn0.NoRDKoh1ApypzT21gVwrPQ',
                  //   'id': 'mapbox.streets',
                  // },
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(-2.952782244794848, -78.92402737229787),
                    builder: (ctx) => new Container(
                      child: new Icon(FontAwesomeIcons.home),
                    ),
                  ),
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(-2.982782244794848, -78.99402737229787),
                    builder: (ctx) => new Container(
                      child: new Icon(FontAwesomeIcons.plus),
                    ),
                  )
                ],
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
