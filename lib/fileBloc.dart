import 'dart:async';

import 'package:flutter/foundation.dart';

class FileBloc {
  Espera getTempoEspera() {
    var now = DateTime.now();
    var espera = Espera(
        dia: now.day.toString(),
        hora: now.hour.toString(),
        minuto: now.minute.toString());
    return espera;
  }

  Stream<Espera> getPeriodicStream() async* {
    yield* Stream.periodic(Duration(minutes: 1), (_) {
      return getTempoEspera();
    });
  }
}

class Espera {
  String dia;
  String hora;
  String minuto;
  Espera({
    @required this.dia,
    @required this.hora,
    @required this.minuto,
  });
}
