import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    PostData data = PostData();

    StartUp mainPage = StartUp();
    return mainPage.main(data.getNames(), data.getImages(),
        data.getCommentsUser(), data.getCommentsMessage());
  }
}

class StartUp {
  Widget main(
      List _names, List _images, List CommentUser, List CommentMessage) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
                children: _names
                    .map((e) => Card(
                          color: Colors.blue,
                          elevation: 0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Align(
                                    child: Text(e),
                                    alignment: Alignment.centerLeft),
                              ),
                              Image.asset(_images[e.indexOf(e)],
                                  width: 375,
                                  height: 325,
                                  fit: BoxFit.fitHeight),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Row(
                                  children: [
                                    Text(CommentUser[0] + ': ', style:  TextStyle(fontWeight: FontWeight.bold),),
                                    Expanded(
                                      child: Text(CommentMessage[0], maxLines: 2, overflow: TextOverflow.ellipsis,) )
                                ],),
                              ),
                            ],
                          ),
                        ))
                    .toList()),
          ),
        ),
        bottomNavigationBar: (BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'Profile')
          ],
        )),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

class PostData {
  final List<String> _names = [
    'Frqcture',
    'JoeMama',
    'more test data',
    'i want to see if this scrolls'
  ];

  final List<String> _images = [
    'assets/image.jpg.webp',
    'assets/image.jpg.webp',
    'assets/image.jpg.webp',
    'assets/image.jpg.webp'
  ];

  final List<String> _commentsUser = ['Frqcture'];
  final List<String> _commentsMessage = [
    'This is a test to see if the comments work, what if i make them even longer so they need to go onto the next line or two'
  ];

  List getNames() {
    return _names;
  }

  List getImages() {
    return _images;
  }

  List getCommentsUser() {
    return _commentsUser;
  }

  List getCommentsMessage() {
    return _commentsMessage;
  }

  void addImage(String UserName, String Message) {
    _commentsUser.add(UserName);
    _commentsMessage.add(Message);
  }
}
