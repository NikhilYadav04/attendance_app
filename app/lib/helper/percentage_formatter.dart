class PercentageFormatter {
  static double calculateDayPercentage(String month, int daysCount) {
    int totalDays;
    switch (month.toLowerCase()) {
      case "january":
      case "march":
      case "may":
      case "july":
      case "august":
      case "october":
      case "december":
        totalDays = 31;
        break;
      case "april":
      case "june":
      case "september":
      case "november":
        totalDays = 30;
        break;
      case "february":
        totalDays = 28;
        break;
      default:
        return -1;
    }
    return (daysCount / totalDays) * 100;
  }
}
