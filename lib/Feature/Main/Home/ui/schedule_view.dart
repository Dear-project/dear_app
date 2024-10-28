import 'package:cell_calendar/cell_calendar.dart';
import 'package:dear_app/Feature/Main/Home/model/schedule_response.dart';
import 'package:dear_app/Feature/Main/Notification/components/notification_bell.dart';
import 'package:dear_app/Shared/theme/dear_badge.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleView extends StatefulWidget {
  List<ScheduleResponse>? list;

  ScheduleView({required this.list, super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {

  DateTime convertDate(String datetime) {
    String date = datetime.substring(0, 8);
    String time = "0000";
    return DateTime.parse('${date}T$time');
  }

  List<CalendarEvent> getCalendarEvent(List<ScheduleResponse> list) {
    List<CalendarEvent> value = [];
    for (int i = 0; i < list.length; i++) {
      var splitedSchedule = list[i].scheduler.split("/ ·  ");
      for (int j = 0; j < splitedSchedule.length; j++) {
        value.add(
          CalendarEvent(
            eventName: splitedSchedule[j],
            eventDate: convertDate(list[i].date),
            eventTextStyle: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w600,
                fontSize: 11),
            eventBackgroundColor: Colors.transparent,
          ),
        );
      }
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final events = getCalendarEvent(widget.list!);
    final cellCalendarPageController = CellCalendarPageController();
    return Scaffold(
      backgroundColor: DearColors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        title: Text(
          "학사일정",
          style: TextStyle(
              fontFamily: "Pretendard",
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: DearColors.white,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 22,
              height: 25,
              child: NotificationBell()
            ),
          ),
        ],
      ),
      body: CellCalendar(
        dateTextStyle: TextStyle(
          fontFamily: "Pretendard",
          fontWeight: FontWeight.w600,
        ),
        cellCalendarPageController: cellCalendarPageController,
        events: events,
        daysOfTheWeekBuilder: (dayIndex) {
          var labels = ["일", "월", "화", "수", "목", "금", "토"];
          Color getlabelsColor(String day) {
            switch (day) {
              case "일":
                return Color(0xffFF0000);
              case "토":
                return Color(0xff0000FF);
              default:
                return Color(0xff000000);
            }
          }

          widget.list;
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                labels[dayIndex],
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: getlabelsColor(labels[dayIndex]),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
        monthYearLabelBuilder: (datetime) {
          final month = datetime!.month.toString();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Text(
              "$month월",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
        onCellTapped: (date) {
          final eventsOnTheDate = events.where((event) {
            final eventDate = event.eventDate;
            return eventDate.year == date.year &&
                eventDate.month == date.month &&
                eventDate.day == date.day;
          }).toList();
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Text(
                "${date.month}월 ${date.day}일",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: eventsOnTheDate
                    .map(
                      (event) => Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16),
                        color: Colors.white,
                        child: Text(
                          event.eventName,
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
