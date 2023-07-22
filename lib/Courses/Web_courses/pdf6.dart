import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdf6 extends StatefulWidget {
  const Pdf6({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Pdf6State createState() => _Pdf6State();
}

class _Pdf6State extends State<Pdf6> {
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
          'https://firebasestorage.googleapis.com/v0/b/e-learning-dev-48cc1.appspot.com/o/WEB%202.0%2Fchapitre%206%20cours%20web%202.0.pdf?alt=media&token=cf09b098-449f-4cf8-8cd0-e3e5e8875f7e',
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