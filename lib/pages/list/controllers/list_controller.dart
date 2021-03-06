import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackHistory {
  TrackHistory(this.string, this.start, this.end);
  String string;
  DateTime start;
  DateTime end;
}

class ListController extends GetxController {
  List<TrackHistory> list = [];

  final List<Text> _options = [
    Text("Resting"),
    Text("Studying"),
    Text("Coding")
  ];

  var listLength = 0.obs;
  var listAdded = false;

  var started = false;

  List<Text> getOptionTexts() {
    return _options;
  }

  void add(var val) {
    list.add(TrackHistory(
        getOptionTexts()[val].data.toString(), DateTime.now(), DateTime.now()));
    print('list.length : ${list.length} ');

    listLength++;
  }
  List<Card> getListWidgets() {
    List<Card> cards = [];

    for (int i = 0; i < list.length; i++)
      cards.add(Card(
        child: ListTile(
          leading: Icon(Icons.people),
          title: Text(list[i].string),
          trailing: Icon(Icons.more_vert),
          onTap: () {},
        ),
      ));

    return cards;
  }
}
