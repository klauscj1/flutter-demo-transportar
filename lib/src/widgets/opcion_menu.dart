import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:transporte_app/src/providers/global_provider.dart';

class OpcionMenu extends StatelessWidget {
  final String imagen;
  final String titulo;
  final String subtitulo;
  final String url;

  OpcionMenu(
      {@required this.imagen,
      @required this.titulo,
      @required this.subtitulo,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: BounceInLeft(
        duration: Duration(milliseconds: 1500),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, url);
            final bloc = GlobalBloc.getViajeBloc(context);
            bloc.changeViajeInterno(0);
            bloc.changeCurrentStep(0);
          },
          child: Container(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  imagen,
                  width: (size.width > 500) ? size.width * .2 : size.width * .8,
                ),
                Text(
                  titulo,
                  style: Theme.of(context).textTheme.display1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    subtitulo,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
