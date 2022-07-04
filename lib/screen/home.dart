import 'package:date_and_time_picker_module/widget/bottomwavy_shape.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? date;
  String? time;
  String? dateTime;
  String? startDate;
  String? endDate;
  DateTimeRange? dateRange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(60)),
                  gradient: LinearGradient(colors: [
                    Colors.blue.shade600,
                    Colors.blue.shade400,
                    Colors.blue.shade300
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.black,
                        child: Text(
                          'D/T',
                          style: TextStyle(color: Colors.deepOrange.shade700),
                          textScaleFactor: 2.5,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Date/Time',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'Picker',
                            style: TextStyle(fontSize: 40),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: CustomPaint(
                  size: Size(
                      MediaQuery.of(context).size.width,
                      (MediaQuery.of(context).size.width * 0.3402777777777778)
                          .toDouble()),
                  painter: BottomWaveShapePainter(),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.42,
                        ),
                        GestureDetector(
                          onTap: () async {
                            DateTime? selectedDate = await pickDate(context);
                            selectedDate != null
                                ? setState(() {
                                    date = selectedDate.day
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        selectedDate.month
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        selectedDate.year.toString();
                                  })
                                : date;
                          },
                          child: SizedBox(
                            height: 65,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.8 -
                                          10,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 25),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            bottomLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(60),
                                          ),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.8),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x336E87D2),
                                              blurRadius: 5,
                                              offset: Offset(1, 5),
                                            ),
                                          ]),
                                      child: Row(
                                        children: [
                                          Text(
                                            date ?? 'Select a date',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: date == null
                                                    ? Colors.grey
                                                    : Colors.black),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.calendar_today,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                date != null
                                    ? Positioned(
                                        top: 2,
                                        left: 25,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: const Text(
                                            'Date',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () async {
                            TimeOfDay? selectedTime = await pickTime(context);
                            selectedTime != null
                                ? setState(() {
                                    time = (selectedTime.hour > 12
                                            ? (selectedTime.hour - 12)
                                                .toString()
                                                .padLeft(2, '0')
                                            : selectedTime.hour
                                                .toString()
                                                .padLeft(2, '0')) +
                                        ':' +
                                        selectedTime.minute
                                            .toString()
                                            .padLeft(2, '0') +
                                        ' ' +
                                        (selectedTime.hour >= 12 ? 'PM' : 'AM');
                                  })
                                : time;
                          },
                          child: SizedBox(
                            height: 65,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.8 -
                                          10,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 25),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            bottomLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(60),
                                          ),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.8),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x336E87D2),
                                              blurRadius: 4,
                                              offset: Offset(2, 5),
                                            ),
                                          ]),
                                      child: Row(
                                        children: [
                                          Text(
                                            time ?? 'Select Time',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: time == null
                                                    ? Colors.grey
                                                    : Colors.black),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.watch_later_outlined,
                                            size: 17,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                time != null
                                    ? Positioned(
                                        top: 2,
                                        left: 25,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: const Text(
                                            'Time',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final selectedDateTime =
                                await pickDateTime(context);
                            selectedDateTime != null
                                ? setState(() {
                                    dateTime = selectedDateTime.day
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        selectedDateTime.month
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        selectedDateTime.year.toString() +
                                        '  ' +
                                        (selectedDateTime.hour > 12
                                            ? (selectedDateTime.hour - 12)
                                                .toString()
                                                .padLeft(2, '0')
                                            : selectedDateTime.hour
                                                .toString()
                                                .padLeft(2, '0')) +
                                        ':' +
                                        selectedDateTime.minute
                                            .toString()
                                            .padLeft(2, '0') +
                                        ' ' +
                                        (selectedDateTime.hour >= 12
                                            ? 'PM'
                                            : 'AM');
                                  })
                                : dateTime;
                          },
                          child: SizedBox(
                            height: 65,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.8 -
                                          10,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 25),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            bottomLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(60),
                                          ),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.8),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x336E87D2),
                                              blurRadius: 4,
                                              offset: Offset(2, 5),
                                            ),
                                          ]),
                                      child: Row(
                                        children: [
                                          Text(
                                            dateTime ?? 'Select Date and Time',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: dateTime == null
                                                    ? Colors.grey
                                                    : Colors.black),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.calendar_today,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                dateTime != null
                                    ? Positioned(
                                        top: 2,
                                        left: 25,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: const Text(
                                            'Date Time',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            dateRange = await pickDateRange(context);
                            dateRange != null
                                ? setState(() {
                                    startDate = dateRange!.start.day
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        dateRange!.start.month
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        dateRange!.start.year.toString();
                                    endDate = dateRange!.end.day
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        dateRange!.end.month
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        dateRange!.end.year.toString();
                                  })
                                : startDate;
                          },
                          child: SizedBox(
                            height: 65,
                            width: MediaQuery.of(context).size.width * 0.8 / 2,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.8 /
                                              2 -
                                          10,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 25),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            bottomLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(60),
                                          ),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.8),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x336E87D2),
                                              blurRadius: 4,
                                              offset: Offset(2, 5),
                                            ),
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            startDate ?? 'From',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: startDate == null
                                                    ? Colors.grey
                                                    : Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                startDate != null
                                    ? Positioned(
                                        top: 2,
                                        left: 25,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: const Text(
                                            'From',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward),
                        GestureDetector(
                          onTap: () async {
                            dateRange = await pickDateRange(context);
                            dateRange != null
                                ? setState(() {
                                    startDate = dateRange!.start.day
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        dateRange!.start.month
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        dateRange!.start.year.toString();
                                    endDate = dateRange!.end.day
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        dateRange!.end.month
                                            .toString()
                                            .padLeft(2, '0') +
                                        '/' +
                                        dateRange!.end.year.toString();
                                  })
                                : endDate;
                          },
                          child: SizedBox(
                            height: 65,
                            width: MediaQuery.of(context).size.width * 0.8 / 2,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.8 /
                                              2 -
                                          10,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 25),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            bottomLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(60),
                                          ),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.8),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x336E87D2),
                                              blurRadius: 4,
                                              offset: Offset(2, 5),
                                            ),
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            endDate ?? 'To',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: startDate == null
                                                    ? Colors.grey
                                                    : Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                endDate != null
                                    ? Positioned(
                                        top: 2,
                                        left: 25,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: const Text(
                                            'To',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> pickDate(context) async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    return selectedDate;
  }

  Future<TimeOfDay?> pickTime(context) async {
    TimeOfDay? selectedTime = await showTimePicker(
        context: context, initialTime: const TimeOfDay(hour: 9, minute: 00));
    return selectedTime;
  }

  Future<DateTime?> pickDateTime(context) async {
    final date = await pickDate(context);
    if (date == null) return null;

    final time = await pickTime(context);
    if (time == null) return null;

    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  Future<DateTimeRange?> pickDateRange(context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: dateRange ?? initialDateRange,
    );
    return newDateRange;
  }
}
