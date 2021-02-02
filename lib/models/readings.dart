class Readings {
  double activePower;
  double activePower1;
  double reactivePower;
  double activePowerCode1 = 660.0;
  double activePowerCode2 = 1980.0;
  double result;
  Readings({this.activePower, this.reactivePower});

  String getActivePower({double activePower, double activePower1}) {
    result = ((activePower - activePower1) * activePowerCode1);
    print(activePower1);

    return result.toString();

    //print(result);
  }

  void getReactivePower() {
    result = reactivePower * 1980;
  }

  void getactivePower() {
    result = reactivePower * 660;
  }

  String getPowerConsumed(double activePower, double activePower1) {
    result = activePower - activePower;
    return result.toString();
  }
}
