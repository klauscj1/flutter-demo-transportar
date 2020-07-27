import 'package:flutter/material.dart';
import 'package:transporte_app/app_localization.dart';

class DialogoAlerta extends StatelessWidget {
  final String description;
  final double margen, avartar;
  final BuildContext context;
  DialogoAlerta(
      {@required this.context,
      @required this.description,
      @required this.margen,
      @required this.avartar});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: this.avartar + this.margen,
            bottom: margen,
            left: margen,
            right: margen,
          ),
          margin: EdgeInsets.only(top: avartar),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(margen),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translate('lbl_alerta'),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: margen),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(
                      AppLocalizations.of(context).translate('lbl_aceptar')),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: margen,
          right: margen,
          child: CircleAvatar(
            backgroundColor: Colors.yellow[700],
            radius: avartar,
            child: Image.asset(
              'assets/iconografia/dceo_alerta.png',
              color: Colors.white,
              height: 50,
              width: 50,
            ),
          ),
        ),
      ],
    );
  }
}
