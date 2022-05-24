import 'package:flutter/material.dart';

class HubRentSpace extends StatefulWidget {
  final String rentPrice;
  final String productTitle;
  const HubRentSpace( this.productTitle,this.rentPrice, {Key? key}) : super(key: key);

  @override
  State<HubRentSpace> createState() => _HubRentSpaceState();
}

class _HubRentSpaceState extends State<HubRentSpace> {
  DateTimeRange dateTimeRange = DateTimeRange(
      start: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      end: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day));

  @override
  Widget build(BuildContext context) {
    final _start = dateTimeRange.start;
    final _end = dateTimeRange.end;
    final differenceDays = dateTimeRange.duration;

    print(DateTime.now().month);
    return Container(
      height: MediaQuery.of(context).size.height * 0.37,
      margin: const EdgeInsets.all(20),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:  [
                   const Text(
                      "Get Space",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(widget.productTitle)
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${double.parse(widget.rentPrice)} RWF",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Text("Rent Payment"),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              width: double.infinity,
              height: 0.3,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Select Dates"),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    pickDateRange();
                  },
                  child: Text("${_start.year}/${_start.month}/${_start.day}")),
            ),
            
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            differenceDays.inDays != 0
                ? Text(
                    '${differenceDays.inDays.toString()} days selected',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  )
                : const Text(""),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 5),
              width: double.infinity,
              height: 0.3,
              color: Theme.of(context).primaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "${double.parse(widget.rentPrice) * differenceDays.inDays} RWF",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Text("Total Payments"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Make Payment"),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        primary: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ],
        )
      ]),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateTimeRange,
        firstDate: (DateTime(2022)),
        lastDate: DateTime(2030));

    if (newDateRange == null) return;
    setState(() {
      dateTimeRange = newDateRange;
    });
  }
}
