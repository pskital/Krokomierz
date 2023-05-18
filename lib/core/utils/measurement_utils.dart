extension MeasurementExtension on int {
  int centimetersToInches() {
    return (this * 0.393700787).toInt();
  }

  int inchesToCentimeters() {
    return (this * 2.54).toInt();
  }

  int toMetersInMiles() {
    return (this * 0.621371192).toInt();
  }

  int toMetersInKilometers() {
    return (this * 1.609344).toInt();
  }

  int lbsToKilograms() {
    return (this * 0.45359237).toInt();
  }

  int kilogramsToLbs() {
    return (this * 2.20462262).toInt();
  }
}
