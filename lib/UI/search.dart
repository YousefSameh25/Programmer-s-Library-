import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: camel_case_types
class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

// ignore: non_constant_identifier_names
TextEditingController search_word = TextEditingController();

// ignore: camel_case_types
class _searchState extends State<search> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(78, 204, 163, 1), width: 2),
          borderRadius: BorderRadius.circular(32)),
      duration: Duration(milliseconds: 350),
      width: _folded ? 55 : 200,
      height: 55,
      child: Row(
        children: 
        [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
            width: 56,
            height: 40,
            padding: EdgeInsets.only(left: 5),
            child: !_folded
                ? TextField(
                    controller: search_word,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                  )
                : null,
          )
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    _folded ? Icons.search : Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                onTap: () 
                {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
