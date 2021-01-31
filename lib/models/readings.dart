class Readings {
  double activePower;
  double activePower1;
  double reactivePower;
  double result;
  Readings({this.activePower, this.reactivePower});

  void getActivePower() {
    result = activePower1 - activePower;
    result = reactivePower * 1980;
  }

  void getReactivePower() {
    result = reactivePower * 1980;
  }

  void getactivePower() {
    result = reactivePower * 660;
  }

  void getPowerConsumed() {
    result = activePower - activePower;
  }
}
