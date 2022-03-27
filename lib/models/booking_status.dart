class BookingStatus {
  String status;
  BookingStatus({required this.status});
}

final List<BookingStatus> bookingStatus = [
  BookingStatus(status: "Individual"),
  BookingStatus(status: "Cooperative"),
  BookingStatus(status: "Company"),
];
