import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class CatService extends ChangeNotifier {
  // 고양이 사진 담을 변수
  List<String> catImages = [];

  CatService() {
    getRandomCatImages();
  }

  void getRandomCatImages() async {
    var result = await Dio().get(
        "https://api.thecatapi.com/v1/images/search?limit=10&mime_types=jpg");

    for (int i = 0; i < result.data.length; i++) {
      var map = result.data[i]; // 반복문을 돌며 i번째의 map에 접근
      print(map);
      print(map['url']); // url만 추출
      catImages.add(map['url']);
    }
    notifyListeners();
  }
}
