extension StringExtention on String {
  String capitalize() {
    return
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
  String leading(String leading) {
    return leading + this;
  }
}