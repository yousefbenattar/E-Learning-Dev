import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdf11 extends StatefulWidget {
  const Pdf11({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Pdf11State createState() => _Pdf11State();
}

class _Pdf11State extends State<Pdf11> {
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
          'https://firebasestorage.googleapis.com/v0/b/e-learning-dev-48cc1.appspot.com/o/JAVA%2FChap%209%20G%C3%A9n%C3%A9ricit%C3%A9.pdf?alt=media&token=b912bd2b-0dbd-446e-b5d6-3ab147c3d9cf',
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