import 'package:flutter/material.dart';
import 'package:transporte_app/app_localization.dart';
import 'package:transporte_app/src/providers/fcm_notification.dart';
import 'package:transporte_app/src/providers/global_provider.dart';
import 'package:transporte_app/src/routes/routes.dart';
import 'package:transporte_app/src/utils/prefencia_util.dart';
import 'package:transporte_app/src/widgets/dialogs/dialogo_info_utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new Preferencias();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  Preferencias pref = Preferencias();

  @override
  void initState() {
    super.initState();
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotificacions();
    pushProvider.mensajes.listen((argumento) {
      //print("se recibe $argumento");
      var titulo = argumento["notification"]["title"];
      var subtitulo = argumento["notification"]["body"];
      var tipo = argumento["tipo"];
      print('datos:  $titulo,$subtitulo,$tipo');
      if (tipo == '1') {
        // UsuarioModel usuario = usuarioModelFromJson(argumento["usuario"]);
        // pref.usuario = usuarioModelToJson(usuario);
        // if (pref.origenFCM == 0) {
        //   print('debe mostrar mensaje');
        //   show(titulo + ". " + subtitulo);
        // } else if (pref.origenFCM == 1) {
        //   pref.indice = 4;
        //   navigatorKey.currentState.pushReplacementNamed('home');
        // } else if (pref.origenFCM == 2) {
        //   pref.indice = 4;
        //   navigatorKey.currentState.pushReplacementNamed('home');
        // }
      } else {
        print('no entra');
      }
      //navigatorKey.currentState.pushNamed('mensaje', arguments: argumento);
    });
  }

  void show(String subtitulo) {
    final context = navigatorKey.currentState.overlay.context;
    // final dialog = AlertDialog(
    //   content: Text(subtitulo),
    // );
    // showDialog(context: context, builder: (x) => dialog);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => DialogoInformacion(
        context: context,
        description: subtitulo,
        aceptar: () => aceptarUsuarioToken(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlobalBloc(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        supportedLocales: [
          Locale('es', 'US'),
          Locale('en', 'US'),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          // If the locale of the device is not supported, use the first one
          // from the list (English, in this case).
          return supportedLocales.first;
        },
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        initialRoute: '/',
        routes: getApplicationsRoutes(),
        theme: Theme.of(context).copyWith(primaryColor: Color(0xff615AAB)),
      ),
    );
  }

  aceptarUsuarioToken(BuildContext context) {
    Navigator.pop(context);
    pref.indice = 4;
    navigatorKey.currentState.pushReplacementNamed('home');
  }
}
