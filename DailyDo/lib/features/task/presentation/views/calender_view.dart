// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/widgets/header_widget.dart';

class CalenderScreenBody extends StatefulWidget {
  const CalenderScreenBody({super.key});

  @override
  State<CalenderScreenBody> createState() => _CalenderScreenBodyState();
}

class _CalenderScreenBodyState extends State<CalenderScreenBody> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    double w(double value) => MediaQuery.of(context).size.width * value / 375;
    double h(double value) => MediaQuery.of(context).size.height * value / 812;
    double sp(double value) => value;

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Column(
        children: [
          headerWidget(context,"Mange Your Time", () {
            Navigator.pop(context);
          },),
          SizedBox(height: h(30)),
          Center(
            child: Container(
              height: h(350),
              width: w(380),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2018, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration:
                  BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
                  selectedDecoration:
                  BoxDecoration(color: Colors.lightBlue, shape: BoxShape.circle),
                  defaultTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.white),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: sp(18)),
                  leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                  rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                  headerPadding: EdgeInsets.symmetric(vertical: 8),
                ),
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) => Center(
                    child: Text(
                      ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'][day.weekday % 7],
                      style: TextStyle(color: Colors.white, fontSize: sp(12)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
