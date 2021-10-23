import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nanistory/Storyhomepage.dart';

import 'package:nanistory/model.dart/nanistory.dart';
import 'package:nanistory/videohomepage.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nani Teri Morni",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text("Story",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ),
            Tab(
              child: Text("Video",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ),
          ],
        ),
        backgroundColor: Colors.yellow,
      ),
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[storyhomepage(), videodata()]),
    );
  }
}
