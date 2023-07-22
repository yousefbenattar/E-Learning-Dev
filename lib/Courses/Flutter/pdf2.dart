
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdf2 extends StatefulWidget {
  const Pdf2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Pdf2State createState() => _Pdf2State();
}

class _Pdf2State extends State<Pdf2> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfPdfViewer.network(
          'https://firebasestorage.googleapis.com/v0/b/e-learning-dev-48cc1.appspot.com/o/Flutter%2FChapter%20II%20--%20More%20about%20Dart.pdf?alt=media&token=fdbe43d1-f74b-4d1e-b210-278d2dc1cde9',
          controller: _pdfViewerController,
          key: _pdfViewerStateKey),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _pdfViewerStateKey.currentState!.openBookmarkView();
              },
              icon:const Icon(
                Icons.bookmark,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                _pdfViewerController.jumpToPage(5);
              },
              icon:const Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                _pdfViewerController.zoomLevel = 1.25;
              },
              icon:const Icon(
                Icons.zoom_in,
                color: Colors.white,
              ))
        ],
      ),
    ));
  }
}