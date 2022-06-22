import 'package:diary/diary_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/date_symbol_data_local.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late final ValueNotifier<List<Diary>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  // RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
  //     .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime? _focusedDay;
  DateTime selectedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  // TextEditingController _textFieldController = TextEditingController();
  TextEditingController textController = TextEditingController();
  // 경고 메세지
  // String? error;

  @override
  void initState() {
    super.initState();

    _focusedDay = selectedDay;
    // _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Diary> _getEventsForDay(DateTime day) {
    // Implementation example
    // print(day);
    return events[day] ?? [];
  }

  // List<Event> _getEventsForRange(DateTime start, DateTime end) {
  //   // Implementation example
  //   final days = daysInRange(start, end);

  //   return [
  //     for (final d in days) ..._getEventsForDay(d),
  //   ];
  // }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(selectedDay, selectedDay)) {
      setState(() {
        selectedDay = focusedDay;
        // _rangeStart = null; // Important to clean those
        // _rangeEnd = null;
        // _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }
  // String? error;

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryService>(
      builder: (context, diaryService, child) {
        // print('new');

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2022, 6, 1),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: selectedDay,
                  calendarFormat: _calendarFormat,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'week',
                    CalendarFormat.twoWeeks: 'month',
                    CalendarFormat.week: '2 weeks',
                  },
                  headerStyle: HeaderStyle(
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 23,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 23,
                    ),
                    formatButtonTextStyle: TextStyle()
                        .copyWith(color: Colors.black, fontSize: 15.0),
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                  selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                  rangeStartDay: _rangeStart,
                  rangeEndDay: _rangeEnd,
                  // rangeSelectionMode: _rangeSelectionMode,
                  eventLoader: _getEventsForDay,
                  // onDayLongPressed: ,
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  calendarStyle: CalendarStyle(
                    // Use `CalendarStyle` to customize the UI
                    outsideDaysVisible: false,
                  ),
                  onDaySelected: _onDaySelected,
                  // onRangeSelected: _onRangeSelected,
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
                Divider(height: 1),
                const SizedBox(height: 8.0),
                Expanded(
                  child: ValueListenableBuilder<List<Diary>>(
                    valueListenable: _selectedEvents,
                    builder: (context, value, _) {
                      return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 4.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ListTile(
                              onTap: () => print('${value[index]}'),
                              title: Text('${value[index]}'),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => InputDialog(),
          ),
        );
      },
    );
  }

  //날짜 클릭시 텍스트 입력장 팝업
  void InputDialog() {
    String? error;
    showDialog(
        context: context,
        builder: (context) {
          return Column(
            children: [
              AlertDialog(
                title: Text('일기 작성'),
                content: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "한 줄 일기를 작성해주세요",
                    errorText: error,
                  ),
                ),
                actions: [
                  // 취소 버튼
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("취소"),
                  ),
                  // 확인 버튼
                  TextButton(
                    onPressed: () {
                      String job = textController.text;
                      if (job.isEmpty) {
                        setState(() {
                          error = "내용을 입력해주세요";
                          print('no');
                        });
                      } else {
                        setState(() {
                          error = null;
                        });
                        print('yes');
                        DiaryService diaryService =
                            context.read<DiaryService>();
                        diaryService.create(job, DateTime.now());
                        // codeDialog = valueText;
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "작성",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
