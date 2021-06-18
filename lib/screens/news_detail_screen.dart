import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.network(
                    "https://satsis.info/uploads/posts/2020-03/1583870954_www.satsis.info__sky-news-uk.png",
                    fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.07,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    Text(
                      'Hosting Live (Virtual!) Events: Lessons from Planning the WordPress.com Growth Summit',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.06),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.03),
                      child: Text(
                        'Published 05.08.2020, 19:17 by Асанбэй-Эль-Шейх',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Text(
                      'It is the latest salvo in a bitter war of words between Mr Cummings, the PM\'s former top aide, and Matt Hancock over the handling of the pandemic. Downing Street did not deny the authenticity of the messages. But the PM\'s official spokesman insisted Mr Johnson has full confidence in the health secretary. \n\nIn a 7,000-word blog, Mr Cummings accused Mr Hancock of trying to rewrite history during a select committee hearing last week which was examining how the government has managed various aspects of the crisis. \n\nHe also took aim at Mr Johnson, claiming he had \"lied about failures\" during the government\'s initial response to the pandemic.\n\n"If No 10 is prepared to lie so deeply and widely about such vital issues of life and death last year, it cannot be trusted now either on Covid or any other crucial issue of war and peace,\" Mr Cummings wrote.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [Icon(Icons.menu)],
          )
        ]),
      ),
    );
  }
}
