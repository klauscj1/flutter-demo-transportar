import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:transporte_app/src/providers/global_provider.dart';
import 'package:transporte_app/src/widgets/headers.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    //final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: BounceInDown(
        duration: Duration(milliseconds: 1500),
        child: (screenSize.width > 500)
            ? _componentes(context)
            : Stack(
                children: <Widget>[
                  Container(
                    height: screenSize.height * .9,
                    child: HeaderWave(),
                  ),
                  _componentes(context)
                ],
              ),
      ),
    );
  }

  Widget _componentes(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            (screenSize.width < 500)
                ? SizedBox(
                    height: screenSize.height * 0.3,
                  )
                : Text(''),
            _textoLogin(context),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            _campoUsuario(context),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            _campoPassword(context),
            SizedBox(
              height: screenSize.height * 0.06,
            ),
            _botonLogin(context),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            _botonRegistrarse(context),
          ],
        ),
      ),
    );
  }

  Widget _textoLogin(BuildContext context) {
    return SafeArea(
      child: Text(
        'Iniciar sesión',
        style: Theme.of(context).textTheme.headline,
      ),
    );
  }

  Widget _campoUsuario(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Correo electrónico', border: OutlineInputBorder()),
    );
  }

  Widget _campoPassword(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Contraseña', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              print('Clic en olvido contraseña');
            },
            child: Text(
              'Olvidaste tu contraseña',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }

  Widget _botonLogin(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      child: FlatButton(
        child: Text(
          'Iniciar sesión',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          final blocMapa = GlobalBloc.getMapaBloc(context);
          blocMapa.changemMapaController(MapController());
          Navigator.pushReplacementNamed(context, 'home');
        },
      ),
    );
  }

  Widget _botonRegistrarse(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      width: double.infinity,
      child: FlatButton(
        child: Text(
          'Crear  una cuenta',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'register');
        },
      ),
    );
  }
}
