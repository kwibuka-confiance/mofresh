// import 'package:flutter/material.dart';

// class ExpanseData {
//   final String expenseCategory;
//   final num jan;
//   final num feb;
//   final num mar;
//   final num apr;
//   final num may;
//   final num jun;
//   final num jul;
//   final num aug;

//   ExpanseData(
//     this.expenseCategory,
//     this.jan,
//     this.feb,
//     this.mar,
//     this.apr,
//     this.may,
//     this.jun,
//     this.jul,
//     this.aug,
//   );
// }

// List<ExpanseData> getChartData() {
//   final List<ExpanseData> chartData = [
//     ExpanseData("Jan", 12, 30, 54, 23, 23, 12, 75, 23),
//     ExpanseData("Feb", 23, 67, 54, 65, 67, 65, 23, 6),
//     ExpanseData("Mar", 34, 30, 34, 23, 54, 12, 75, 23),
//     ExpanseData("Apr", 54, 30, 64, 65, 54, 64, 75, 4),
//     ExpanseData("May", 65, 30, 64, 43, 45, 12, 32, 23),
//     ExpanseData("Jun", 76, 30, 32, 23, 54, 12, 87, 7),
//     ExpanseData("Jul", 23, 30, 23, 23, 44, 43, 75, 23),
//     ExpanseData("Aug", 0, 0, 0, 0, 0, 0, 0, 0),
//     ExpanseData("Sept", 0, 0, 0, 0, 0, 0, 0, 0),
//     ExpanseData("Oct", 0, 0, 0, 0, 0, 0, 0, 0),
//     ExpanseData("Nov", 0, 0, 0, 0, 0, 0, 0, 0),
//     ExpanseData("Dec", 0, 0, 0, 0, 0, 0, 0, 0),
//   ];

//   return chartData;
// }

import 'package:flutter/material.dart';

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
      "Jan",
      12,
      "Security",
      "Paid",
      "230,000",
      "Aug,24,2021",
    ),
    ExpanseData(
      "Feb",
      34,
      "Water",
      "Paid",
      "32,000",
      "Aug,24,2021",
    ),
    ExpanseData(
      "Mar",
      54,
      "Electricty",
      "Unpaid",
      "43,000",
      "Aug,24,2021",
    ),
    ExpanseData(
      "Apr",
      34,
      "Maintenance",
      "Unpaid",
      "232,000",
      "Aug,24,2021",
    ),
    ExpanseData(
      "May",
      45,
      "Others",
      "Paid",
      "232,000",
      "Aug,24,2021",
    ),
    ExpanseData(
      "Jun",
      65,
      "Total",
      "Paid",
      "230,000",
      "Aug,24,2021",
    ),
  ];

  return chartData;
}
