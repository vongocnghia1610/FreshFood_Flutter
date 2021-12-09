String getSession() {
  final DateTime now = DateTime.now();
  final int hour = now.hour;
  if (hour <= 4) {
    return "Buổi tối";
  }
  if (hour < 11) {
    return "Buổi sáng";
  } else if (hour < 14) {
    return "Buổi trưa";
  } else if (hour < 18)
    return "Buổi chiều";
  else
    return "Buổi tối";
}
