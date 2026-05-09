String getFormattedExpiry(String expiryDateStr) {
  try {
    DateTime expiryDate = DateTime.parse(expiryDateStr);
    DateTime now = DateTime.now();

    Duration difference = expiryDate.difference(now);

    if (difference.isNegative) {
      return 'Expired';
    }

    int daysLeft = difference.inDays;

    if (daysLeft >= 30) {
      int months = daysLeft ~/ 30;
      return '$months months';
    } else {
      return '$daysLeft days';
    }
  } catch (e) {
    return 'Unknown';
  }
}
