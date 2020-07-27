import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transporte_app/src/models/ciudad.dart';

class CiudadSearchDelegate extends SearchDelegate<Ciudad> {
  final List<Ciudad> ciudades = [
    Ciudad(
      nombre: "Cuenca",
    ),
    Ciudad(
      nombre: "Quito",
    ),
    Ciudad(
      nombre: "Guayaquil",
    ),
    Ciudad(
      nombre: "Quevedo",
    ),
    Ciudad(
      nombre: "Machala",
    ),
    Ciudad(
      nombre: "Esmeraldas",
    ),
  ];

  final ciudadesRecientes = [
    Ciudad(
      nombre: "Quevedo",
    ),
    Ciudad(
      nombre: "Machala",
    ),
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //acciones para el appbar
    return [
      IconButton(
        icon: Icon(FontAwesomeIcons.eraser),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon en la izquierda de la appbar
    return IconButton(
      icon: Icon(FontAwesomeIcons.arrowLeft),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final lista = query.isEmpty
        ? ciudadesRecientes
        : ciudades
            .where(
                (p) => p.nombre.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
              onTap: () {
                close(context, lista[index]);
              },
              leading: Icon(FontAwesomeIcons.city),
              title: RichText(
                text: TextSpan(
                    text: lista[index].nombre.substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: lista[index].nombre.substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ]),
              ),
            ));
  }
}
