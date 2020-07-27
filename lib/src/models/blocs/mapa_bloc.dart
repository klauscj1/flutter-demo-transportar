import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:latlong/latlong.dart';

class MapaBloc {
  final _vaijeInternoController = new BehaviorSubject<MapController>();
  Stream<MapController> get mapaControllerStream =>
      _vaijeInternoController.stream;
  Function(MapController) get changemMapaController =>
      _vaijeInternoController.sink.add;
  MapController get mapaController => _vaijeInternoController.value;

  final _centroController = new BehaviorSubject<LatLng>();
  Stream<LatLng> get centroStream => _centroController.stream;
  Function(LatLng) get changeCentro => _centroController.sink.add;
  LatLng get centro => _centroController.value;

  final _puntosController = new BehaviorSubject<List<LatLng>>();
  Stream<List<LatLng>> get puntosStream => _puntosController.stream;
  Function(List<LatLng>) get changePuntos => _puntosController.sink.add;
  List<Marker> get puntos {
    return _puntosController.value
        .map((punto) => Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(punto.latitude, punto.longitude),
              builder: (ctx) => new Container(
                child: new Icon(FontAwesomeIcons.home),
              ),
            ))
        .toList();
  }

  dispose() {
    _vaijeInternoController?.close();
    _centroController?.close();
    _puntosController?.close();
  }
}
