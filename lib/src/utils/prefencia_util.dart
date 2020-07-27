import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  static final Preferencias _instancia = Preferencias._internal();
  factory Preferencias() {
    return _instancia;
  }

  Preferencias._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  //get y sets
  get indice {
    return _prefs.getInt('indice') ?? 1;
  }

  set indice(int valor) {
    _prefs.setInt('indice', valor);
  }

  get tokenFCM {
    return _prefs.getString('tokenfcm') ?? 1;
  }

  set tokenFCM(String valor) {
    _prefs.setString('tokenfcm', valor);
  }

  get empresaNombre {
    return _prefs.getString('empresanombre') ?? 1;
  }

  set empresaNombre(String valor) {
    _prefs.setString('empresanombre', valor);
  }

  get empresaCodigo {
    return _prefs.getString('empresacodigo') ?? 1;
  }

  set empresaCodigo(String valor) {
    _prefs.setString('empresacodigo', valor);
  }

  get idioma {
    return _prefs.getString('idioma') ?? 'es';
  }

  set idioma(String valor) {
    _prefs.setString('idioma', valor);
  }

  get ustId {
    return _prefs.getInt('ustid') ?? 0;
  }

  set ustId(int valor) {
    _prefs.setInt('ustid', valor);
  }

  get origenFCM {
    return _prefs.getInt('origenfcm') ?? 0;
  }

  set origenFCM(int valor) {
    _prefs.setInt('origenfcm', valor);
  }

  get usuCodigo {
    return _prefs.getString('usucodigo') ?? '';
  }

  set usuCodigo(String valor) {
    _prefs.setString('usucodigo', valor);
  }

  get usuario {
    return _prefs.getString('usuario') ?? '';
  }

  set usuario(String valor) {
    _prefs.setString('usuario', valor);
  }
}
