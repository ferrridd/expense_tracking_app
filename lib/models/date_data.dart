class DateData {
  final int day;
  final int month;
  final int year;
  final int amount;

  DateData(
      {required this.day,
      required this.month,
      required this.year,
      required this.amount});
  factory DateData.fromJson(Map<String, dynamic> json) => DateData(
        day: json["day"],
        month: json["month"],
        year: json["year"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() =>
      {"day": day, "month": month, "year": year, "amount": amount};
}
