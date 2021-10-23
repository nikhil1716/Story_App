import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nanistory/model.dart/nanivideo.dart';
import 'package:nanistory/webpage.dart';

class videodata extends StatefulWidget {
  const videodata({Key? key}) : super(key: key);

  @override
  _videodataState createState() => _videodataState();
}

class _videodataState extends State<videodata> {
  Videoexample? videoAll;
  List<Videoexample> data = [];
  var arr = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callApi();
  }

  callApi() async {
    var resp = await http.get(
        Uri.parse("http://mapi.trycatchtech.com/v1/kids_stories/videos_list"));
    // ignore: avoid_print
    print("resp is-->${resp.body}");
    arr = jsonDecode(resp.body);
    setState(() {
      for (var item in arr) {
        data.add(Videoexample.fromJson(item));
      }
    });
    // print("data is ${storybook?.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: GestureDetector(
      onTap: () {},
      child: carddata(),
    )));
  }

  Widget carddata() {
    return
        //Container(child: GridView.builder(itemCount: data.length,itemBuilder: (context, index) {
        //   return Row(
        //     children: [
        //       Container(
        //           height: 150,
        //           width: 150,
        //           child: Column(
        //             children: [
        //               Image.network("${data[index].image}"),
        //               Text("${data[index].title}")
        //             ],
        //           ))
        //     ],
        //   );
        // }));
        GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.9),
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          width: 200,
          child: Column(
            children: [
              Image.network(
                "${data[index].thumbImage}",
              ),
              Text(
                "${data[index].title}",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      },
    );
  }
}
