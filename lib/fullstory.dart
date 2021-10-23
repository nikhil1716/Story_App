import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nanistory/model.dart/nanistory.dart';

class fullstory extends StatefulWidget {
  List<Story> hello = [];
  final int indexNo;
  final Story? discrep;

  fullstory(
      {Key? key, required this.hello, required this.indexNo, this.discrep})
      : super(key: key);

  @override
  _fullstoryState createState() => _fullstoryState();
}

class _fullstoryState extends State<fullstory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Details Arr ${widget.hello.length}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Scaffold(
          body: Container(
        child: cardemo(),
      )),
    ));
  }

  cardemo() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "${widget.discrep?.postTitle}",
            style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 30,
          ),
          Image.asset(
            "assets/nani2.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                "${widget.discrep?.postDesc}",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
