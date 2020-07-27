import 'package:flutter/material.dart';
import 'package:transporte_app/src/pages/entregar_paquete.dart';
import 'package:transporte_app/src/pages/home_page.dart';
import 'package:transporte_app/src/pages/login_page.dart';
import 'package:transporte_app/src/pages/nuevo_pasajero.dart';
import 'package:transporte_app/src/pages/nuevo_viaje.dart';
import 'package:transporte_app/src/pages/paquete_page.dart';
import 'package:transporte_app/src/pages/recibir_paquete_page.dart';
import 'package:transporte_app/src/pages/register_page.dart';
import 'package:transporte_app/src/pages/slideshow_page.dart';
import 'package:transporte_app/src/pages/splash_page.dart';
import 'package:transporte_app/src/pages/viaje_page.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => SplashPage(),
    'onboarding': (BuildContext context) => SlideshowPage(),
    'login': (BuildContext context) => LoginPage(),
    'register': (BuildContext context) => RegisterPage(),
    'home': (BuildContext context) => HomePage(),
    'viaje': (BuildContext context) => ViajePage(),
    'paquete': (BuildContext context) => PaquetePage(),
    'nuevo-viaje': (BuildContext context) => NuevoViajePage(),
    'nuevo-pasajero': (BuildContext context) => NuevoPasajeroPage(),
    'entregar-paquete': (BuildContext context) => EntregarPaquetePage(),
    'recibir-paquete': (BuildContext context) => RecibirPaquetePage(),
  };
}
