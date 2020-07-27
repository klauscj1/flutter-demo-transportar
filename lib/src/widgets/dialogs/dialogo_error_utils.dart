import 'package:flutter/material.dart';
import 'package:transporte_app/app_localization.dart';
import 'package:transporte_app/src/utils/size_config.dart';

class DialogoError extends StatelessWidget {
  final String description;

  final BuildContext context;
  DialogoError({
    @required this.context,
    @required this.description,
  });

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
            top:
                SizeConfig.espacioVertical * 6 + SizeConfig.espacioVertical * 2,
            bottom: SizeConfig.espacioVertical * 2,
            left: SizeConfig.espacioVertical * 2,
            right: SizeConfig.espacioVertical * 2,
          ),
          margin: EdgeInsets.only(top: SizeConfig.espacioVertical * 6),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(SizeConfig.espacioVertical * 2),
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
                AppLocalizations.of(context).translate('lbl_error'),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: SizeConfig.espacioVertical * 2),
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
          left: SizeConfig.espacioVertical * 2,
          right: SizeConfig.espacioVertical * 2,
          child: CircleAvatar(
            backgroundColor: Colors.red[500],
            radius: SizeConfig.espacioVertical * 6,
            child: Image.asset(
              'assets/iconografia/dceo_error.png',
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
