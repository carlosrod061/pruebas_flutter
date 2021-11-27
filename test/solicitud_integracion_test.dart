import 'package:pruebas_flutter/models/solicitud.dart';
import 'package:test/test.dart';

void main() {
  group('Integracion Proceso', () {
    test('Solicitud no valida promedio mayor a 10', () {
      bool bValid = Solicitud.promedioValido("12");
      double salarioMensual = Solicitud.calculaSalarioMensual("100");
      bool solicitudAprobada = false;
      if (bValid) {
        solicitudAprobada =
            Solicitud.solicitudAprobada(double.parse("12"), salarioMensual);
      } else {
        solicitudAprobada = false;
      }

      expect(solicitudAprobada, false);
    });

    test('Solicitud valida', () {
      bool bValid = Solicitud.promedioValido("9");
      double salarioMensual = Solicitud.calculaSalarioMensual("400");
      bool solicitudAprobada = false;
      if (bValid) {
        solicitudAprobada =
            Solicitud.solicitudAprobada(double.parse("9"), salarioMensual);
      } else {
        solicitudAprobada = false;
      }

      expect(solicitudAprobada, true);
    });
  });
}
