import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'book.dart';
import 'book_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future<String> getBookData(job) async {
  //   var result = await Dio().get(
  //       "https://www.googleapis.com/books/v1/volumes?q=${job}&startIndex=0&maxResults=10");
  //   print(result.data['items'][1]['volumeInfo']['title']);
  //   String booklist = result.data['items'];
  //   // bookList.add(booklist);

  //   return booklist;
  // }

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('a');
    return Consumer<BookService>(builder: (context, bookService, child) {
      print('b');
      // bucketService로 부터 bucketList 가져오기
      List<Book> bookList = bookService.bookList;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0.0,
          title: Transform(
            // you can forcefully translate values left side using Transform
            transform: Matrix4.translationValues(20.0, 7.0, 0.0),
            child: Text(
              "Book Store",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 80), // bottom 영역 크기
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    // color: Colors.red,
                    padding: EdgeInsets.only(
                      left: 315,
                    ),
                    child: Text(
                      "total ${bookList.length}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: "원하시는 책을 검색해주세요.",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      // 돋보기 아이콘
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // print("돋보기 아이콘 클릭");
                          setState(() {
                            var job = textController.text;
                            BookService bookService =
                                context.read<BookService>();
                            // print(job);
                            bookService.getBookData(job);
                            // bookList.clear();
                          });
                          bookList.clear();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: bookList.isEmpty
            ? Center(
                child: Text(
                "검색어를 입력해 주세요",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ))
            : ListView.builder(
                itemCount: bookList.length, // bucketList 개수 만큼 보여주기
                itemBuilder: (context, index) {
                  var book =
                      bookService.bookList[index]; // index에 해당하는 bucket 가져오기
                  return Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        leading: SizedBox(
                          child: Image.network(
                            book.thumbnail,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(book.title),
                        // subtitle: Text(book.subtitle),
                        onTap: () {
                          launch(book.prevlink);
                        },
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                    ],
                  );
                },
              ),
      );
    });
  }
}
