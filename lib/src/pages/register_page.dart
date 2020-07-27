import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:transporte_app/src/widgets/headers.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BounceInDown(
        duration: Duration(milliseconds: 1500),
        child: Stack(
          children: <Widget>[
            (screenSize.width < 500)
                ? Container(
                    height: screenSize.height * .9,
                    child: HeaderWave(),
                  )
                : Text(''),
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
            _campoNombre(context),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            _campoPassword(context),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            _campoPasswordRepetir(context),
            SizedBox(
              height: screenSize.height * 0.06,
            ),
            _botonRegister(context),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            _botonLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _textoLogin(BuildContext context) {
    return SafeArea(
      child: Text(
        'Registrate',
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

  Widget _campoNombre(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Nombre del usuario', border: OutlineInputBorder()),
    );
  }

  Widget _campoPassword(BuildContext context) {
    return SingleChildScrollView(
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña', border: OutlineInputBorder()),
      ),
    );
  }

  Widget _campoPasswordRepetir(BuildContext context) {
    return SingleChildScrollView(
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Confirmar contraseña', border: OutlineInputBorder()),
      ),
    );
  }

  Widget _botonRegister(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      child: FlatButton(
        child: Text(
          'Registrarse',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _botonLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            print('Clic en ya tengo cuenta');
            Navigator.pushReplacementNamed(context, 'login');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Ya tengo cuenta',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        )
      ],
    );
  }
}
