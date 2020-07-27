import 'package:flutter/material.dart';
import 'package:transporte_app/src/models/blocs/mapa_bloc.dart';
import 'package:transporte_app/src/models/blocs/viaje_bloc.dart';

class GlobalBloc extends InheritedWidget {
  static GlobalBloc _instancia;
  factory GlobalBloc({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new GlobalBloc._internal(
        key: key,
        child: child,
      );
    }
    return _instancia;
  }

  final viajeBloc = ViajeBloc();
  final mapaBloc = MapaBloc();
  // final homeBloc = HomeBloc();
  // final listadoMedidorBloc = ListadoMedidorBloc();

  GlobalBloc._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ViajeBloc getViajeBloc(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<GlobalBloc>()).viajeBloc;
  }

  static MapaBloc getMapaBloc(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<GlobalBloc>()).mapaBloc;
  }

  // static HomeBloc obtenerHomeBloc(BuildContext context) {
  //   return (context.dependOnInheritedWidgetOfExactType<Provider>()).homeBloc;
  // }

  // static ListadoMedidorBloc obtenerListadoMedidorBloc(BuildContext context) {
  //   return (context.dependOnInheritedWidgetOfExactType<Provider>())
  //       .listadoMedidorBloc;
  // }
}
