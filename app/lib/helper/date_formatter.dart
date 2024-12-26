class DateFormatter {
  static String getMonthName(String monthNumber) {
    //* List of month names
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    //* Convert the input to an integer
    int? index = int.tryParse(monthNumber);

    //* Return the corresponding month name
    return months[index! - 1];
  }
}
