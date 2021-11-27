class Solicitud {
  Solicitud();

  static bool promedioValido(String promedio) {
    try {
      if (double.parse(promedio) >= 0 && double.parse(promedio) < 11) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static double calculaSalarioMensual(String salarioSemanal) {
    try {
      if (double.parse(salarioSemanal) < 0) {
        return 0.0;
      } else {
        double salarioMensual;
        salarioMensual = double.parse(salarioSemanal) * 4;
        return salarioMensual;
      }
    } catch (e) {
      return 0.00;
    }
  }

  static bool solicitudAprobada(double promedio, double salarioMensual) {
    if (promedio > 8 && salarioMensual <= 4000) {
      return true;
    } else {
      return false;
    }
  }
}
