import 'package:flutter/material.dart';
import 'package:nanistory/videohomepage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webpage extends StatefulWidget {
  final int indexNo;
  final videodata? URIlan;
  webpage({Key? key, required this.indexNo, this.URIlan}) : super(key: key);

  @override
  _webpageState createState() => _webpageState();
}

class _webpageState extends State<webpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  );
  }
}
