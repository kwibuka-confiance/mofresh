

class ExpanseData {
  final String expenseCategory;
  final num jan;
  final String itemName;
  final String status;
  final String totalAmount;
  final String date;

  ExpanseData(
    this.expenseCategory,
    this.jan,
    this.itemName,
    this.status,
    this.totalAmount,
    this.date,
  );
}

List<ExpanseData> getChartData() {
  final List<ExpanseData> chartData = [
    ExpanseData(
      "Mon",
      12,
      "Security",
      "Paid",
      "230,000",
      "Aug,24,2021",
    ),
    ExpanseData(
      "Tue",
      34,
      "Water",
      "Paid",
      "32,000",
      "Aug,24,2021",
    ),
    ExpanseData(
      "Wed",
      54,
      "Electricty",
      "Unpaid",
      "43,000",
      "Aug,24,2021",
    ),
    ExpanseData(
      "Thu",
      34,
      "Maintenance",
      "Unpaid",
      "232,000",
      "Aug,24,2021",
    ),
    ExpanseData(
      "Fri",
      45,
      "Others",
      "Paid",
      "232,000",
      "Aug,24,2021",
    ),
    ExpanseData(
      "Sat",
      65,
      "Total",
      "Paid",
      "230,000",
      "Aug,24,2021",
    ),
     ExpanseData(
      "San",
      65,
      "Total",
      "Paid",
      "230,000",
      "Aug,24,2021",
    ),
  ];

  return chartData;
}
