class Parking {
  bool isFilled;
  String carLicense;
  DateTime? entryDate;
  DateTime? exitDate;
  String? label;

  Parking(
      {this.isFilled = false,
      this.carLicense = "",
      this.entryDate,
      this.exitDate,
      this.label});
}
