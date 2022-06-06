import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shazam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Builder(builder: (context) {
        DefaultTabController.of(context)?.addListener(() {
          setState(() {});
        });

        return Scaffold(
          body: Stack(
            children: [
              TabBarView(
                children: [
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: TabPageSelector(
                          color: DefaultTabController.of(context)?.index == 1
                              ? Colors.blue[300]
                              : Colors.grey[400],
                          selectedColor:
                              DefaultTabController.of(context)?.index == 1
                                  ? Colors.white
                                  : Colors.blue,
                          indicatorSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// 첫번째 페이지
class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const songs = [
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
    ];

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 50,
          ),
          width: double.infinity,
          height: 25,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                // // top: 0,
                left: 0,
                child: Container(
                  // width: double.infinity,
                  height: 25,
                  width: 40,
                  // color: Colors.red,
                  child: Icon(Icons.settings),
                ),
              ),
              Positioned(
                left: 163,
                child: Container(
                  // color: Colors.blue,
                  height: 18,
                  width: 100,
                  child: Text(
                    "라이브러리",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 25,
            bottom: 5,
            left: 7,
          ),
          child: Row(
            children: [
              Icon(Icons.favorite),
              Text(
                "  Shazam",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 10,
          endIndent: 10,
          indent: 10,
          // thickness: 10,
          color: Colors.grey[400],
        ),
        Container(
          margin: EdgeInsets.only(
            top: 15,
            bottom: 5,
            left: 7,
          ),
          child: Row(
            children: [
              Icon(Icons.person),
              Text(
                "  아티스트",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 10,
          endIndent: 10,
          indent: 10,
          // thickness: 10,
          color: Colors.grey[400],
        ),
        Container(
          margin: EdgeInsets.only(
            top: 15,
            bottom: 5,
            left: 7,
          ),
          child: Row(
            children: [
              Icon(Icons.music_note),
              Text(
                "  회원님을 위한 재생 목록",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        // Divider(
        //   height: 10,
        //   endIndent: 10,
        //   indent: 10,
        //   // thickness: 10,
        //   color: Colors.grey[400],
        // ),
        Container(
          margin: EdgeInsets.only(
            top: 15,
            bottom: 5,
            left: 10,
          ),
          child: Row(
            children: [
              Text(
                "최근 Shazam",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            // color: Colors.blue,
            margin: EdgeInsets.only(top: 15),
            child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(3),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 5,
                    childAspectRatio: (175.5 / 270),
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: Colors.grey[300]!, width: 2), // 테두리
                        ),
                        padding: EdgeInsets.all(5),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                "https://image.bugsm.co.kr/album/images/500/40126/4012637.jpg",
                                // height: 300,
                              ),
                              Text(
                                "가을밤에 든 생각",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text("잔나비"),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Image.network(
                                  "https://mirjamvandenbos.com/wp-content/uploads/2019/12/2-22455_spotify-apple-music-logo-listen-apple-music-png.jpg",
                                  height: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: Colors.grey[300]!, width: 2), // 테두리
                        ),
                        padding: EdgeInsets.all(5),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                "https://image.bugsm.co.kr/album/images/500/40126/4012637.jpg",
                                // height: 300,
                              ),
                              Text(
                                "가을밤에 든 생각",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text("잔나비"),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Image.network(
                                  "https://mirjamvandenbos.com/wp-content/uploads/2019/12/2-22455_spotify-apple-music-logo-listen-apple-music-png.jpg",
                                  height: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: Colors.grey[300]!, width: 2), // 테두리
                        ),
                        padding: EdgeInsets.all(5),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                "https://image.bugsm.co.kr/album/images/500/40126/4012637.jpg",
                                // height: 300,
                              ),
                              Text(
                                "가을밤에 든 생각",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text("잔나비"),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Image.network(
                                  "https://mirjamvandenbos.com/wp-content/uploads/2019/12/2-22455_spotify-apple-music-logo-listen-apple-music-png.jpg",
                                  height: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: Colors.grey[300]!, width: 2), // 테두리
                        ),
                        padding: EdgeInsets.all(5),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                "https://image.bugsm.co.kr/album/images/500/40126/4012637.jpg",
                                // height: 300,
                              ),
                              Text(
                                "가을밤에 든 생각",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text("잔나비"),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Image.network(
                                  "https://mirjamvandenbos.com/wp-content/uploads/2019/12/2-22455_spotify-apple-music-logo-listen-apple-music-png.jpg",
                                  height: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: Colors.grey[300]!, width: 2), // 테두리
                        ),
                        padding: EdgeInsets.all(5),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                "https://image.bugsm.co.kr/album/images/500/40126/4012637.jpg",
                                // height: 300,
                              ),
                              Text(
                                "가을밤에 든 생각",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text("잔나비"),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Image.network(
                                  "https://mirjamvandenbos.com/wp-content/uploads/2019/12/2-22455_spotify-apple-music-logo-listen-apple-music-png.jpg",
                                  height: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: Colors.grey[300]!, width: 2), // 테두리
                        ),
                        padding: EdgeInsets.all(5),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                "https://image.bugsm.co.kr/album/images/500/40126/4012637.jpg",
                                // height: 300,
                              ),
                              Text(
                                "가을밤에 든 생각",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text("잔나비"),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Image.network(
                                  "https://mirjamvandenbos.com/wp-content/uploads/2019/12/2-22455_spotify-apple-music-logo-listen-apple-music-png.jpg",
                                  height: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

// 두번째 페이지
class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 99, 169, 227),
            Color.fromARGB(255, 25, 85, 176)
          ],
        ),
      ),
      child: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 40,
              right: 20,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 23,
                ),
                Spacer(),
                Icon(
                  Icons.show_chart,
                  color: Colors.white,
                  size: 23,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 3,
              left: 27,
              right: 20,
            ),
            child: Row(
              children: [
                Text(
                  "라이브러리",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  "차트",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                top: 110,
                bottom: 60,
              ),
              child: Text(
                "Shazam하려면 탭하세요",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
            margin: EdgeInsets.only(
              // top: 60,
              bottom: 80,
            ),
            child: Image.asset(
              'assets/logo.png',
              height: 230,
            ),
          ),
          Image.asset(
            'assets/search.png',
            height: 60,
          ),
        ],
      )),
    );
  }
}

// 세번째 페이지
class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const chartData = {
      'korea': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
      'global': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
      'newyork': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
    };

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 50,
                bottom: 15,
              ),
              child: Text(
                "차트",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 180,
              // margin: EdgeInsets.only(
              //   bottom: 0,
              // ),
              width: double.infinity,
              color: Colors.purple[800],
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 25,
                    ),
                    width: 300,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          3,
                        )),
                    alignment: Alignment.center,
                    child: Text(
                      '국가 및 도시별 차트',
                      style: TextStyle(
                        color: Colors.purple[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '전 세계',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.grey[400],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        margin: EdgeInsets.only(
                          bottom: 3,
                          left: 15,
                          right: 10,
                        ),
                        child: Row(children: [
                          Text("대한민국 차트"),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text("모두보기"),
                          ),
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            "https://ibighit.com/bts/images/bts/discography/dynamite/Q7gBkUusiDcIYljQOMX9ow6W.jpg",
                            height: 100,
                          ),
                          Image.network(
                            "https://ibighit.com/bts/images/bts/discography/dynamite/Q7gBkUusiDcIYljQOMX9ow6W.jpg",
                            height: 100,
                          ),
                          Image.network(
                            "https://ibighit.com/bts/images/bts/discography/dynamite/Q7gBkUusiDcIYljQOMX9ow6W.jpg",
                            height: 100,
                          ),
                        ],
                      ),
                      Container(
                          // color: Colors.green,
                          width: double.infinity,
                          height: 18,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                // // top: 0,
                                left: 14,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  // color: Colors.red,
                                  child: Text(
                                    "Dynamite",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 144,
                                child: Container(
                                  // color: Colors.blue,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "Dynamite",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // // top: 0,
                                left: 274,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "Dynamite",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          // color: Colors.green,
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          width: double.infinity,
                          height: 18,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                // // top: 0,
                                left: 14,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  // color: Colors.red,
                                  child: Text(
                                    "BTS",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 144,
                                child: Container(
                                  // color: Colors.blue,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "BTS",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // // top: 0,
                                left: 274,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "BTS",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Divider(
                        height: 10,
                        thickness: 10,
                        color: Colors.grey[400],
                      ),
                      Container(
                        height: 35,
                        margin: EdgeInsets.only(
                          bottom: 3,
                          left: 15,
                          right: 10,
                        ),
                        child: Row(children: [
                          Text("글로벌 차트"),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text("모두보기"),
                          ),
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            "https://ibighit.com/bts/images/bts/discography/dynamite/Q7gBkUusiDcIYljQOMX9ow6W.jpg",
                            height: 100,
                          ),
                          Image.network(
                            "https://ibighit.com/bts/images/bts/discography/dynamite/Q7gBkUusiDcIYljQOMX9ow6W.jpg",
                            height: 100,
                          ),
                          Image.network(
                            "https://ibighit.com/bts/images/bts/discography/dynamite/Q7gBkUusiDcIYljQOMX9ow6W.jpg",
                            height: 100,
                          ),
                        ],
                      ),
                      Container(
                          // color: Colors.green,
                          width: double.infinity,
                          height: 18,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                // // top: 0,
                                left: 14,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  // color: Colors.red,
                                  child: Text(
                                    "Dynamite",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 144,
                                child: Container(
                                  // color: Colors.blue,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "Dynamite",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // // top: 0,
                                left: 274,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "Dynamite",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          // color: Colors.green,
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          width: double.infinity,
                          height: 18,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                // // top: 0,
                                left: 14,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  // color: Colors.red,
                                  child: Text(
                                    "BTS",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 144,
                                child: Container(
                                  // color: Colors.blue,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "BTS",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // // top: 0,
                                left: 274,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "BTS",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Divider(
                        height: 10,
                        thickness: 10,
                        color: Colors.grey[400],
                      ),
                      Container(
                        height: 35,
                        margin: EdgeInsets.only(
                          bottom: 3,
                          left: 15,
                          right: 10,
                        ),
                        child: Row(children: [
                          Text("뉴욕 차트"),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text("모두보기"),
                          ),
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            "https://ibighit.com/bts/images/bts/discography/dynamite/Q7gBkUusiDcIYljQOMX9ow6W.jpg",
                            height: 100,
                          ),
                          Image.network(
                            "https://ibighit.com/bts/images/bts/discography/dynamite/Q7gBkUusiDcIYljQOMX9ow6W.jpg",
                            height: 100,
                          ),
                          Image.network(
                            "https://ibighit.com/bts/images/bts/discography/dynamite/Q7gBkUusiDcIYljQOMX9ow6W.jpg",
                            height: 100,
                          ),
                        ],
                      ),
                      Container(
                          // color: Colors.green,
                          width: double.infinity,
                          height: 18,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                // // top: 0,
                                left: 14,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  // color: Colors.red,
                                  child: Text(
                                    "Dynamite",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 144,
                                child: Container(
                                  // color: Colors.blue,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "Dynamite",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // // top: 0,
                                left: 274,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "Dynamite",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          // color: Colors.green,
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          width: double.infinity,
                          height: 18,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                // // top: 0,
                                left: 14,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  // color: Colors.red,
                                  child: Text(
                                    "BTS",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 144,
                                child: Container(
                                  // color: Colors.blue,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "BTS",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // // top: 0,
                                left: 274,
                                child: Container(
                                  // width: double.infinity,
                                  height: 18,
                                  width: 100,
                                  child: Text(
                                    "BTS",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
