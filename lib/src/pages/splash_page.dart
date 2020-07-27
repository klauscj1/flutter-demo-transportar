import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:transporte_app/src/utils/prefencia_util.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), navegar);
  }

  Preferencias pref = Preferencias();

  navegar() async {
    pref.indice = 1;
    if (pref.indice == 1) {
      Navigator.pushReplacementNamed(context, 'onboarding');
    } else if (pref.indice == 2) {
      Navigator.pushReplacementNamed(context, 'empresa');
    } else if (pref.indice == 3) {
      Navigator.pushReplacementNamed(context, 'imei');
    } else if (pref.indice == 4) {
      Navigator.pushReplacementNamed(context, 'home');
    }
    //else if (pref.estado == 2) {
    //   UsuarioModel usuario = pref.usuario;
    //   if (usuario != null) {
    //     final homeBloc = Provider.obtenerHomeBloc(context);
    //     homeBloc.changeUsuario(usuario);
    //     await ApiProvider.obtenerTest(context);
    //     Navigator.pushReplacementNamed(context, 'home');
    //     print('$usuario');
    //   } else {
    //     pref.estado = 1;
    //     Navigator.pushReplacementNamed(context, 'login');
    //   }
    // } else {
    //Navigator.pushReplacementNamed(context, 'onboarding');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _cuerpo(context));
  }

  Widget _cuerpo(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: screenSize.height * 0.4,
        ),
        _logo(context),
        SizedBox(
          height: screenSize.height * 0.4,
        ),
        _poweredBy(context)
      ],
    );
  }

  Widget _logo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BounceInDown(
          duration: Duration(milliseconds: 1500),
          child: Text(
            'Transporta',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _poweredBy(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BounceInDown(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Powered by '),
          Image.asset(
            'assets/images/icreativa.png',
            width: screenSize.width * 0.18,
          )
        ],
      ),
    );
  }
}
