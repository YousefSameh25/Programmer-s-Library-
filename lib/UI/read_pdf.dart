import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class read_pdf extends StatefulWidget 
{
  String url;
  read_pdf({@required this.url});
  @override
  _read_pdf createState() => _read_pdf(url: url);
}

class _read_pdf extends State<read_pdf> {
  PDFDocument _doc;
  bool _loading;
  String url;

  _read_pdf({@required this.url});

  void initState() 
  {
    super.initState();
    load_pdf();
  }

  // ignore: non_constant_identifier_names
  load_pdf() async 
  {
    setState(() 
    {
      _loading = true;
    });
    PDFDocument doc = await PDFDocument.fromURL(url);
    setState(() 
    {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('The book'),
      ),
      body: Center(
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: _doc,
                scrollDirection: Axis.horizontal,
                pickerButtonColor: Colors.red[900],
                indicatorBackground: Colors.red[900],
                lazyLoad: true,
              ),
      ),
    );
  }
}
