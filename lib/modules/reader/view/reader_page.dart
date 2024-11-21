import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

@RoutePage()
class ReaderPage extends StatefulWidget {
  final String title;
  final String file;
  const ReaderPage({
    super.key,
    required this.title,
    required this.file
  });
  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text(widget.title),
      ),
      body: SfPdfViewer.file(File(widget.file)),
    );
  }
}