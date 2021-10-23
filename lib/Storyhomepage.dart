// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:nanistory/videohomepage.dart';
import 'package:nanistory/fullstory.dart';
import 'package:nanistory/model.dart/nanistory.dart';

class storyhomepage extends StatefulWidget {
  const storyhomepage({Key? key}) : super(key: key);

  @override
  _storyhomepageState createState() => _storyhomepageState();
}

class _storyhomepageState extends State<storyhomepage> {
  Story? storybook;
  List<Story> ddr = [];
  var arr = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callApi();
  }

  callApi() async {
    var resp = await http.get(Uri.parse(
        "http://mapi.trycatchtech.com/v1/kids_stories/kids_stories_list"));
    // ignore: avoid_print
    print("resp is-->${resp.body}");
    arr = jsonDecode(resp.body);
    setState(() {
      for (var item in arr) {
        ddr.add(Story.fromJson(item));
      }
    });
    // print("data is ${storybook?.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        "${ddr[index].postTitle}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: 2,
                      ),
                      Image.asset("assets/nani1.jpg"),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext ctx) => fullstory(
                                          hello: ddr,
                                          indexNo: index,
                                          discrep: ddr[index],
                                        )));
                          },
                          child: Text("Check Story")),
                      Divider(
                        thickness: 3,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: ddr.length,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
