import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  String title;
  String body;
  String img;
  String createdAt;
  NewsDetailScreen({this.title, this.body, this.img, this.createdAt});

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Stack(
              children: <Widget>[
                Positioned(
                left: 1.0,
                top: 2.0,
                child: Icon(Icons.arrow_back, color: Colors.black54),
              ),
              Icon(Icons.arrow_back, color: Colors.white),
              ],
            )/*Icon(Icons.arrow_back)*/,
            backgroundColor: Colors.black,
            // pinned: true,
            // snap: false,
            // backgroundColor: Color.fromRGBO(0, 0, 0, 0.0),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(widget.img, fit: BoxFit.fitWidth,),
            ),
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  // Container(
                  //   // height: MediaQuery.of(context).size.height * 0.3,
                  //   child: Image.network(
                  //     widget.img,
                  //     fit: BoxFit.fitWidth,
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.07,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${widget.title}'
                            /*'Hosting Live (Virtual!) Events: Lessons from Planning the WordPress.com Growth Summit'*/,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width * 0.08,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.03),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.createdAt}'
                              /*'Published 05.08.2020, 19:17 by Асанбэй-Эль-Шейх'*/,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.03),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.body}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ]
        /*Stack(children: [
          Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.3,
                child: Image.network(
                  widget.img,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.07,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${widget.title}'
                        *//*'Hosting Live (Virtual!) Events: Lessons from Planning the WordPress.com Growth Summit'*//*,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.03),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.createdAt}'
                          *//*'Published 05.08.2020, 19:17 by Асанбэй-Эль-Шейх'*//*,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.03),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.body}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          )
        ]),*/
      ),
    );
  }
}
