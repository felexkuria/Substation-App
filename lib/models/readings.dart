class Readings {
  double activePower;
  double activePower1;
  double reactivePower1;
  // String name;
  double reactivePower;
  double activePowerCode1 = 660.0;
  double activePowerCode2 = 1980.0;
  double result;
  double result2;
  double result3;
  Readings({this.activePower, this.reactivePower});

  String getActivePower({double activePower, double activePower1}) {
    result = ((activePower - activePower1) * activePowerCode1);
    //result.round();

    return result.toStringAsFixed(2);

    //print(result);
  }

  String getReactivePower({double reactivePower, double reactivePower1}) {
    result2 = ((reactivePower - reactivePower1) * activePowerCode2);
    //print(result);
    //result2.roundToDouble();

    return result2.toStringAsFixed(2);
  }

  void getactivePower() {
    result = reactivePower * 660;
  }

  String getPowerConsumed({double activePower, double activePower1}) {
    result3 = activePower - activePower1;

    return result3.toStringAsFixed(2);
  }
}
