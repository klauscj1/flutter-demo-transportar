import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transporte_app/src/models/ciudad.dart';
import 'package:transporte_app/src/providers/global_provider.dart';
import 'package:transporte_app/src/widgets/ciudad_search_delegate.dart';
import 'package:transporte_app/src/widgets/mapa.dart';

class NuevoViajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conductor'),
      ),
      body: _cuerpo(context),
    );
  }

  Widget _cuerpo(BuildContext context) {
    final bloc = GlobalBloc.getViajeBloc(context);
    return StreamBuilder(
      stream: bloc.currentStepStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Step> steps = [
          _primerPaso(context, (bloc.currentStep == 0) ? true : false),
          _segundoPaso(context, (bloc.currentStep == 1) ? true : false),
          _tercerPaso(context, (bloc.currentStep == 2) ? true : false),
        ];
        return Column(children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps,
              currentStep: bloc.currentStep,
              onStepContinue: () {
                if (bloc.currentStep + 1 != steps.length) {
                  bloc.changeCurrentStep(bloc.currentStep + 1);
                }
              },
              onStepTapped: (step) {
                bloc.changeCurrentStep(bloc.currentStep + 1);
              },
              onStepCancel: () {
                if (bloc.currentStep > 0) {
                  bloc.changeCurrentStep(bloc.currentStep - 1);
                }
              },
            ),
          ),
        ]);
      },
    );
  }

  Step _primerPaso(BuildContext context, bool activo) {
    return Step(
      title: Text('Ciudad'),
      isActive: activo,
      content: Column(
        children: <Widget>[
          _eleccionCidades(context),
          _ciudadOrigen(context),
          _ciudadDestino(context)
        ],
      ),
    );
  }

  Widget _eleccionCidades(BuildContext context) {
    final bloc = GlobalBloc.getViajeBloc(context);
    final estiloNoSelecionado = BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.all(Radius.circular(8)),
        //border: Border.all(color: Colors.grey),
        border: Border.all(color: Colors.grey));
    final estiloSelecionado = BoxDecoration(
        color: Theme.of(context).primaryColor,
        //borderRadius: BorderRadius.all(Radius.circular(8)),
        //border: Border.all(color: Theme.of(context).primaryColor),
        border: Border.all(color: Theme.of(context).primaryColor));

    final estiloTextoSeleccionado = TextStyle(color: Colors.white);
    final estiloTextoNoSeleccionado = TextStyle(color: Colors.black);
    final screenSize = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: bloc.viajeInternoStream,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        int interno = snapshot.data;
        return Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: screenSize.width * .30,
                height: screenSize.width * .15,
                decoration:
                    (interno == 1) ? estiloSelecionado : estiloNoSelecionado,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.city,
                      color: (interno == 1)
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Dentro de ciudad',
                      style: (interno == 1)
                          ? estiloTextoSeleccionado
                          : estiloTextoNoSeleccionado,
                    )
                  ],
                ),
              ),
              onTap: () {
                bloc.changeViajeInterno(1);
              },
            ),
            GestureDetector(
              child: Container(
                width: screenSize.width * .30,
                height: screenSize.width * .15,
                decoration:
                    (interno == 0) ? estiloSelecionado : estiloNoSelecionado,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.code,
                      color: (interno == 0)
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Entre ciudadades',
                      style: (interno == 0)
                          ? estiloTextoSeleccionado
                          : estiloTextoNoSeleccionado,
                    )
                  ],
                ),
              ),
              onTap: () {
                bloc.changeViajeInterno(0);
              },
            )
          ],
        ));
      },
    );
  }

  Widget _ciudadOrigen(BuildContext context) {
    final bloc = GlobalBloc.getViajeBloc(context);

    return StreamBuilder(
      stream: bloc.viajeInternoStream,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          return Row(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.chevronRight),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: StreamBuilder(
                    stream: bloc.ciudadOrigenStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      TextEditingController _controllador =
                          TextEditingController();
                      _controllador.text =
                          snapshot.data != null ? snapshot.data.nombre : '';
                      return TextField(
                        controller: _controllador,
                        onTap: () async {
                          final respuesta = await showSearch(
                              context: context,
                              delegate: CiudadSearchDelegate());
                          if (respuesta != null) {
                            bloc.changeCiudadOrigen(respuesta);
                          }
                        },
                        decoration: InputDecoration(hintText: 'Desde'),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _ciudadDestino(BuildContext context) {
    final bloc = GlobalBloc.getViajeBloc(context);
    return StreamBuilder(
      stream: bloc.viajeInternoStream,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        int interno = snapshot.data;
        if (snapshot.hasData) {
          return (interno == 0)
              ? Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: StreamBuilder(
                          stream: bloc.ciudadDestinoStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<Ciudad> snapshot) {
                            print('otra vezzz xxx');
                            //print('otra vezzz==> ${snapshot.data.nombre}');
                            TextEditingController _controllador =
                                TextEditingController();
                            _controllador.text = snapshot.data != null
                                ? snapshot.data.nombre
                                : '';
                            return TextField(
                              controller: _controllador,
                              onTap: () async {
                                final respuesta = await showSearch(
                                    context: context,
                                    delegate: CiudadSearchDelegate());
                                if (respuesta != null) {
                                  bloc.changeCiudadDestino(respuesta);
                                }
                                print(
                                    'se tiene como respuesta destino: $respuesta');
                              },
                              decoration: InputDecoration(hintText: 'Hacia'),
                            );
                          },
                        ),
                      ),
                    ),
                    FaIcon(FontAwesomeIcons.chevronLeft),
                  ],
                )
              : Container();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Step _segundoPaso(BuildContext context, bool activo) {
    return Step(
      //isActive: true,
      //state: StepState.editing,
      title: const Text('Mapa'),
      content: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.grey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mapa()),
              );
            },
            child: Text('Ir a mapa'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    );
  }

  Step _tercerPaso(BuildContext context, bool activo) {
    return Step(
      title: Text('Avatar'),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    );
  }
}
