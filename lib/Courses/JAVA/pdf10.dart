import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdf10 extends StatefulWidget {
  const Pdf10({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Pdf10State createState() => _Pdf10State();
}

class _Pdf10State extends State<Pdf10> {
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
          'https://firebasestorage.googleapis.com/v0/b/e-learning-dev-48cc1.appspot.com/o/JAVA%2FChap%208%20Les%20flux%20d%E2%80%99entr%C3%A9e%20sortie.pdf?alt=media&token=61c1eb8a-115a-4aad-b84b-c3ab4f97460f',
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