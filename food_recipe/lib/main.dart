import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "수제버거",
        "imgUrl": "https://i.ibb.co/pnZK1rz/burger.jpg",
      },
      {
        "category": "건강식",
        "imgUrl": "https://i.ibb.co/7KLJjJV/salad.jpg",
      },
      {
        "category": "한식",
        "imgUrl": "https://i.ibb.co/0V4RVK4/korean-food.jpg",
      },
      {
        "category": "디저트",
        "imgUrl": "https://i.ibb.co/HhGRhds/dessert.jpg",
      },
      {
        "category": "피자",
        "imgUrl": "https://i.ibb.co/QdDtTvt/pizza.jpg",
      },
      {
        "category": "볶음밥",
        "imgUrl": "https://i.ibb.co/gt9npFZ/stir-fried-rice.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
        appBar: AppBar(
          title: Container(
            width: 300,
            // color: Colors.red,
            margin: EdgeInsets.only(left: 0),
            child: Row(
              children: [
                Text("Food Recipe",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.black,
                      // backgroundColor: Colors.white,
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 130,
                  ),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          backgroundColor: Colors.white,
          // bottomOpacity: 0.0,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(children: [
          Container(
            color: Colors.grey[50],
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  hintText: '상품을 검색해주세요.',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    // return Text(dataList[index]['category']);
                    return Card(
                        // elevation: 6,
                        margin: const EdgeInsets.only(
                          top: 5,
                          bottom: 15,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Container(
                                width: double.infinity,
                                height: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.5),
                                          BlendMode.darken),
                                      image: NetworkImage(
                                        dataList[index]['imgUrl'],
                                      ),
                                      fit: BoxFit.cover),
                                ),
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      dataList[index]['category'],
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    )))));

                    // Image.network(dataList[index]['imgUrl']);
                  }),
            ),
          ),
        ]),
        drawer: Drawer(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Container(
                // margin: EdgeInsets.all(0),
                height: 250,
                child: DrawerHeader(
                    decoration: BoxDecoration(color: Colors.orange[300]),
                    margin: EdgeInsets.only(bottom: 0),
                    // margin: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(23),
                          // width: 70,
                          // height: 70,
                          child: CircleAvatar(
                            radius: 40,
                            child: ClipOval(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Text('닉네임',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        Text('hello@world.com',
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                child: AspectRatio(
                  aspectRatio: 3 / 1,
                  child: PageView(
                    children: [
                      Image.network("https://i.ibb.co/0mXKmZq/banner-1.jpg"),
                      Image.network("https://i.ibb.co/DDgYrJR/banner-2.jpg"),
                      Image.network("https://i.ibb.co/v1RMHN4/banner-3.jpg"),
                      Image.network("https://i.ibb.co/NmNsrr2/banner-4.jpg"),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ListView(padding: EdgeInsets.zero, children: [
                ListTile(
                  // tileColor: Colors.red,
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text('구매내역',
                      style: TextStyle(
                          // color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          )),
                ),
                ListTile(
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text('저장한 레시피',
                      style: TextStyle(
                          // color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          )),
                ),
              ]))
            ])));
  }
}
