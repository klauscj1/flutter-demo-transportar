import 'package:rxdart/rxdart.dart';
import 'package:transporte_app/src/models/ciudad.dart';

class ViajeBloc {
  final _vaijeInternoController = new BehaviorSubject<int>();
  Stream<int> get viajeInternoStream => _vaijeInternoController.stream;
  Function(int) get changeViajeInterno => _vaijeInternoController.sink.add;
  int get viajeInterno => _vaijeInternoController.value;

  final _currentStepController = new BehaviorSubject<int>();
  Stream<int> get currentStepStream => _currentStepController.stream;
  Function(int) get changeCurrentStep => _currentStepController.sink.add;
  int get currentStep => _currentStepController.value;

  final _ciudadOrigenController = new BehaviorSubject<Ciudad>();
  Stream<Ciudad> get ciudadOrigenStream => _ciudadOrigenController.stream;
  Function(Ciudad) get changeCiudadOrigen => _ciudadOrigenController.sink.add;
  Ciudad get ciudadOrigen => _ciudadOrigenController.value;

  final _ciudadDestinoController = new BehaviorSubject<Ciudad>();
  Stream<Ciudad> get ciudadDestinoStream => _ciudadDestinoController.stream;
  Function(Ciudad) get changeCiudadDestino => _ciudadDestinoController.sink.add;
  Ciudad get ciudadDestino => _ciudadDestinoController.value;

  dispose() {
    _vaijeInternoController?.close();
    _currentStepController?.close();
    _ciudadOrigenController?.close();
    _ciudadDestinoController?.close();
  }
}
