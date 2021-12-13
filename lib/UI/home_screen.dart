import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:programer_library/UI/books_screen.dart';
import 'package:programer_library/UI/find_books.dart';
import 'package:programer_library/UI/find_searched_language.dart';
import 'package:programer_library/UI/search.dart';
import 'package:programer_library/classes/pro_lan.dart';
import 'package:programer_library/data/prog_lang.dart';

// ignore: camel_case_types
class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

// ignore: camel_case_types
class _home_screenState extends State<home_screen> {
  List<pro_lan> pl = languages_list;

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context)?.size?.width ?? 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(57, 62, 70, 1),
          appBar: AppBar(
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            backgroundColor: Color.fromRGBO(35, 41, 49, 1),
            actions: [
              Container(
                width: 80,
                child: Center(
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    color: Color.fromRGBO(78, 204, 163, 1),
                    onPressed: () {
                      setState(() {
                        find_language();
                        refresh();
                      });
                    },
                    child: Text(
                      'Show',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              search(),
              SizedBox(
                width: 10,
              )
            ],
          ),
          body: ListView.builder(
            itemCount: searched_language.length != 0
                ? searched_language.length
                : pl.length,
            itemBuilder: (context, index) {
              //all
              if (search_word.text == '') {
                return GestureDetector(
                    onTap: () {
                      find_books(pl[index].id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookScreen(wanted_books: choosed_books)),
                      );
                    },
                    child: Container(
                      width: width - 30,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(78, 204, 163, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(35, 41, 49, 1),
                            spreadRadius: 6,
                            blurRadius: 4,
                            offset: Offset(
                                3, 0), // changes position of shadow (x,y)
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(pl[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold)),
                          Image(
                            image: AssetImage(pl[index].logo_url),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            pl[index].description,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ));
              } else if (search_word.text != '' &&
                  searched_language.length != 0) {
                return GestureDetector(
                    onTap: () {
                      find_books(searched_language[index].id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookScreen(wanted_books: choosed_books)),
                      );
                    },
                    child: Container(
                      width: width - 30,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(78, 204, 163, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(35, 41, 49, 1),
                            spreadRadius: 6,
                            blurRadius: 4,
                            offset: Offset(
                                3, 0), // changes position of shadow (x,y)
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(searched_language[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold)),
                          Image(
                            image:
                                AssetImage(searched_language[index].logo_url),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            searched_language[index].description,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ));
              } else
                return null;
            },
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: BouncingScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
