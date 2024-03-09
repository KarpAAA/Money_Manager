extension DateExtention on DateTime {

  compareIgnoringTime(DateTime dateTime){
    DateTime date1WithoutTime = DateTime(this.year, this.month, this.day);
    DateTime date2WithoutTime = DateTime(dateTime.year, dateTime.month, dateTime.day);

    return date1WithoutTime.isAtSameMomentAs(date2WithoutTime);
  }
}
