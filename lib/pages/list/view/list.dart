import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mytimetrackerapp/pages/list/controllers/count_controller.dart';
import 'package:mytimetrackerapp/pages/list/controllers/list_controller.dart';


class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listController = Get.find<ListController>();
    final countController = Get.find<CountController>();
    var currentValue = 0;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countController.increment();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        title: Text("Time Tracker"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            child: Container(
              child: Obx(()=>
                Text('list要素数 : ${listController.listLength.value} -------floating buttonクリック数 : ${countController.count.value}')
              ),
            ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: listController.listLength.value,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 50,
                      child: ListTile(
                          leading: Icon(Icons.people),
                          title: Text(
                            '${DateFormat.jm().format(listController.list[index].start)}: ${listController.list[index].string}',
                            style: TextStyle(fontSize: 16),
                          )),
                    );
                  })),
            ),

            //入力周り
            Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoTheme(
                    child: CupertinoPicker(
                      children: listController.getOptionTexts(),
                      onSelectedItemChanged: (value) {
                        currentValue = value;
                      }, //TODO
                      itemExtent: 40,
                    ),
                    data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        pickerTextStyle:
                            TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      barBackgroundColor: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 1000,
                    child: ElevatedButton(
                      child: Text(
                        "開始",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, //ボタンの背景色
                      ),
                      onPressed: () {
                        listController.add(currentValue);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
