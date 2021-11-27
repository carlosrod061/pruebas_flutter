import 'package:test/test.dart';
import 'package:pruebas_flutter/models/solicitud.dart';

//Pruebas unitarias

void main() {
  //TESTS PARA FUNCION DE PROMEDIO VALIDO
  group('Funcion promedioValido', () {
    test('El promedio es mayor a 10 (no valido)', () {
      bool bValid = Solicitud.promedioValido("12");

      expect(bValid, false);
    });

    test('El promedio es menor a 0 (no valido)', () {
      bool bValid = Solicitud.promedioValido("-1");

      expect(bValid, false);
    });

    test('El promedio no es numerico (no valido)', () {
      bool bValid = Solicitud.promedioValido("A");

      expect(bValid, false);
    });

    test('El promedio esta entre 0 y 10(valido)', () {
      bool bValid = Solicitud.promedioValido("8");

      expect(bValid, true);
    });
  });

  //TESTS PARA FUNCION DE CALCULA SALARIO MENSUAL
  group('Funcion calculaSalarioMensual', () {
    test('Salario Semanal = 0', () {
      double dSalarioMensual = Solicitud.calculaSalarioMensual("0");

      expect(dSalarioMensual, 0);
    });
    test('Salario Semanal = A', () {
      double dSalarioMensual = Solicitud.calculaSalarioMensual("A");

      expect(dSalarioMensual, 0);
    });
    test('Salario Semanal = -212', () {
      double dSalarioMensual = Solicitud.calculaSalarioMensual("-212");

      expect(dSalarioMensual, 0);
    });
    test('Salario Semanal = 200', () {
      double dSalarioMensual = Solicitud.calculaSalarioMensual("200");

      expect(dSalarioMensual, 800);
    });
  });
  //TESTS PARA FUNCION DE SOLICITUD APROBADA
  group('Funcion solicitudAprobada', () {
    test('Promedio = 7, Salario Mensual = 200', () {
      bool bSolicitudAprobada = Solicitud.solicitudAprobada(7, 200);

      expect(bSolicitudAprobada, false);
    });
    test('Promedio = 8.2, Salario Mensual = 1000', () {
      bool bSolicitudAprobada = Solicitud.solicitudAprobada(8.2, 1000);

      expect(bSolicitudAprobada, true);
    });

    test('Promedio = 8.5, Salario Mensual = 6000', () {
      bool bSolicitudAprobada = Solicitud.solicitudAprobada(8.5, 6000);

      expect(bSolicitudAprobada, false);
    });

    test('Promedio = 5, Salario Mensual = 0', () {
      bool bSolicitudAprobada = Solicitud.solicitudAprobada(5, 0);

      expect(bSolicitudAprobada, false);
    });
  });
}
