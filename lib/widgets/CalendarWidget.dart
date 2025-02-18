/*
//كود التقويم العادي 
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Weekly Calendar'),
      ),
      body: CalendarWidget(),
    ),
  ));
}

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime(2025, 2, 13); // اليوم المحدد
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان الشهر
          Text(
            'February 2025',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),

          // التقويم والأزرار في صف واحد
          Row(
            children: [
              // زر السابق
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 20, // تصغير حجم الأيقونة
                onPressed: () {
                  setState(() {
                    _focusedDay = _focusedDay.subtract(Duration(days: 7)); // الأسبوع السابق
                  });
                },
              ),

              // التقويم الأسبوعي
              Expanded(
                child: TableCalendar(
                  firstDay: DateTime(2025, 1, 1),
                  lastDay: DateTime(2025, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: CalendarFormat.week, // عرض أسبوع واحد فقط
                  headerVisible: false, // إخفاء الهيدر الافتراضي
                  daysOfWeekVisible: true, // عرض أيام الأسبوع
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                    weekendStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // زر التالي
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 20, // تصغير حجم الأيقونة
                onPressed: () {
                  setState(() {
                    _focusedDay = _focusedDay.add(Duration(days: 7)); // الأسبوع التالي
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}