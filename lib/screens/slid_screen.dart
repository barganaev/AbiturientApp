import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:abiturient_app/screens/news_screen.dart';

class Slidersdd extends StatefulWidget {
  final String lang;

  Slidersdd({this.lang});

  @override
  _SlidersddState createState() => _SlidersddState();
}

class _SlidersddState extends State<Slidersdd> {
  double screenHeight;
  double screenWidth;

  Map<int, Map<String, String>> _welcomeText;

  final _welcomeTextKaz = {
    1: {
      'text': ' ',
      'description':
          'Широкий выбор специальностей технического и профессионального образования',
      'img': 'assets/img_silder_1.png',
    },
    2: {
      'text': ' ',
      'description':
          'Возможность подачи заявки на поступление в колледж в режиме онлайн',
      'img': 'assets/img_silder_2.png',
    },
    3: {
      'text': ' ',
      'description':
          'Много полезной информации и анонсов для правильного выбора профессии',
      'img': 'assets/img_silder_3.png',
    },
  };

  final _welcomeTextRus = {
    1: {
      'text': ' ',
      'description':
          'Широкий выбор специальностей технического и профессионального образования',
      'img': 'assets/img_silder_1.png',
    },
    2: {
      'text': ' ',
      'description':
          'Возможность подачи заявки на поступление в колледж в режиме онлайн',
      'img': 'assets/img_silder_2.png',
    },
    3: {
      'text': ' ',
      'description':
          'Много полезной информации и анонсов для правильного выбора профессии',
      'img': 'assets/img_silder_3.png',
    },
  };
  String next;
  String pass;
  String buttonText;
  int curIndex = 0;

  int _current = 0;
  CarouselController sliderController = CarouselController();
  List<Image> photos = [];

  @override
  void initState() {
    super.initState();
    if (widget.lang == 'kaz') {
      _welcomeText = _welcomeTextKaz;
      next = "Келесі";
      pass = "Өткізу";
      buttonText = "Бастау";
    } else {
      _welcomeText = _welcomeTextRus;
      next = "Следующая";
      pass = "Пропустить";
      buttonText = "Старт";
    }
  }

  List<T> map<T>(Map map, Function handler) {
    List<T> result = [];
    for (var i = 0; i < map.length; i++) {
      result.add(handler(i, map[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.07),
                child: Image.asset(
                  'assets/logo_edus_blue.png',
                  height: screenHeight * 0.04,
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    CarouselSlider(
                      carouselController: sliderController,
                      options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              curIndex = index;
                              _current = index;
                            });
                          },
                          enableInfiniteScroll: false,
                          height: screenHeight * 0.55,
                          autoPlay: false,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          viewportFraction: 1.0),
                      items: _welcomeText.keys.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Container(
                                    height: screenHeight * 0.3,
                                    child: Image.asset(_welcomeText[i]['img']),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.03,
                                    left: screenWidth * 0.05,
                                    right: screenWidth * 0.05,
                                  ),
                                  child: Text(
                                    _welcomeText[i]['description'],
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.06,
                                        fontWeight: FontWeight.w300),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: screenWidth * 0.08,
                                ),
                                (i == _welcomeText.length)
                                    ? RaisedButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: screenHeight * 0.015,
                                            horizontal: screenWidth * 0.06),
                                        child: Text(
                                          buttonText,
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            color: Colors.white,
                                          ),
                                        ),
                                        color: Color(0xFF1269db),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        onPressed: () async {
                                          // print(s);
                                          // shared.saveBool('seenIntro', true);
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    NewsScreen(),
                                              ),
                                              (route) => false);
                                        },
                                      )
                                    : Text(' '),
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(
                        _welcomeText,
                        (index, url) {
                          return Container(
                            width: screenWidth * 0.03,
                            height: screenHeight * 0.02,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color(0xFF1269db)
                                  : Color(0xFFF2F2F2),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
