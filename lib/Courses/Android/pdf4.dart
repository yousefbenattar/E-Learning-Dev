import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdf4 extends StatefulWidget {
  const Pdf4({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Pdf4State createState() => _Pdf4State();
}

class _Pdf4State extends State<Pdf4> {
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
          'https://firebasestorage.googleapis.com/v0/b/e-learning-dev-48cc1.appspot.com/o/Android%2FChapitre%204%20ListView%20et%20gestion%20d%E2%80%99une%20liste%20d%E2%80%99items.pdf?alt=media&token=7679a308-dca8-4b97-abf4-82b693ace4fc',
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