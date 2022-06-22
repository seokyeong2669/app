import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'book.dart';

class BookService extends ChangeNotifier {
  // 책 목록
  List<Book> bookList = [];

  Future<String> getBookData(String job) async {
    var result = await Dio().get(
        "https://www.googleapis.com/books/v1/volumes?q=$job&startIndex=0&maxResults=15");

    notifyListeners();

    String nophoto =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyTCWc8MMglc2fQjamLEgQK6BGTAituuBvAQ&usqp=CAU";
    for (int i = 0; i < 15; i++) {
      String title = result.data['items'][i]['volumeInfo']['title'];
      late String subtitle;
      if (result.data['items'][i]['volumeInfo']['subtitle'] == null ||
          result.data['items'][i]['volumeInfo']['subtitle'] == "") {
        subtitle = "ok";
      } else {
        subtitle = result.data['items'][i]['volumeInfo']['subtitle'];
      }
      // subtitle.isEmpty ? '' : subtitle;
      // String thumbnail =
      //     result.data['items'][i]['volumeInfo']['imageLinks']['thumbnail'];
      late String thumbnail;
      if (result.data['items'][i]['volumeInfo']['imageLinks'] == null ||
          result.data['items'][i]['volumeInfo']['imageLinks']['thumbnail'] ==
              null ||
          result.data['items'][i]['volumeInfo']['imageLinks']['thumbnail'] ==
              "") {
        thumbnail = nophoto;
      } else {
        // thumbnail = nophoto;
        thumbnail =
            result.data['items'][i]['volumeInfo']['imageLinks']['thumbnail'];
      }

      String prevlink = result.data['items'][i]['volumeInfo']['previewLink'];
      // print(i);
      // print(title);
      // print(subtitle);
      // print(thumbnail);
      // print(prevlink);

      bookList.add(Book(title, subtitle, thumbnail, prevlink));
    }
    // print(bookList);
    String booklist = result.data['items'];

    return booklist;
  }

  // notifyListeners();
}
