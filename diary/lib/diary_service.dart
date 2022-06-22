import 'dart:collection';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Diary {
  String text; // 내용
  DateTime createdAt; // 작성 시간

  Diary({
    required this.text,
    required this.createdAt,
  });
}

// class Event {
//   final String title;

//   const Event(this.title);

//   @override
//   String toString() => title;
// }
// var events = List<Diary>(),
var events = LinkedHashMap<DateTime, dynamic>(
  equals: isSameDay,
  hashCode: getHashCode,
// )..addAll(eventSource);
)..addAll(eventSource);

Map<DateTime, dynamic> eventSource = {
  kToday: '산책을 다녀왔다',
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
// final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
// final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class DiaryService extends ChangeNotifier {
  /// Diary 목록
  List<Diary> diaryList = [];

  /// 특정 날짜의 diary 조회
  List<Diary> getByDate(DateTime date) {
    // for (int i = 0; i < diaryList.length; i++) {
    //   if (diaryList[i].createdAt == date) {}
    // }
    return diaryList;
  }

  /// Diary 작성
  void create(String text, DateTime selectedDate) {
    diaryList.add(Diary(text: text, createdAt: selectedDate));
    // kToday.add(Diary(text: text, createdAt: selectedDate));
    print('dddd');
    notifyListeners();
  }

  /// Diary 수정
  void update(DateTime createdAt, String newContent) {
    // diaryList[createdAt] = diary;
    // notifyListeners();
  }

  /// Diary 삭제
  void delete(DateTime createdAt) {
    // diaryList.removeAt(diaryList.indexOf(createdAt));
    // notifyListeners();
  }
}
