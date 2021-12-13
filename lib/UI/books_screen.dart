import 'package:flutter/material.dart';
import 'package:programer_library/UI/read_pdf.dart';
import 'package:programer_library/classes/book.dart';

// ignore: must_be_immutable
class BookScreen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  List<book> wanted_books;

  // ignore: non_constant_identifier_names
  BookScreen({@required this.wanted_books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(92, 82, 127, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(62, 44, 65, 1),
        title: Text(
          'Books',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: wanted_books.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          read_pdf(url: wanted_books[index].pdf_url)
                          ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(110, 133, 178, 1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(62, 44, 65, 1),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset:
                            Offset(0, -3), // changes position of shadow (x,y)
                      ),
                    ]),
                margin: EdgeInsets.all(15),
                height: 300,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        wanted_books[index].name,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black,
                        thickness: 1.5,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 150,
                              height: 150.0,
                              child:
                                  Image.network(wanted_books[index].logo_url)),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  wanted_books[index].description,
                                  maxLines: 7,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
