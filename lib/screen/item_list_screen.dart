// ignore_for_file: avoid_unnecessary_containers, avoid_types_as_parameter_names, prefer_const_constructors, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider/controller/item_controller.dart';
import 'package:get/get.dart';
class ListViewNumber extends StatelessWidget {
 ListViewNumber({ Key? key }) : super(key: key);
  final ItemController _itemController = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Phone number"),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Obx(()=>ListView.builder(
              itemCount: _itemController.numberList.length,
              itemBuilder: (BuildContext context , index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.primaries[Random().nextInt(17)],
                  ),
                  title: Text("${_itemController.numberList[index].name}"),
                  subtitle: Text("${_itemController.numberList[index].number}"),
                  trailing: IconButton(
                    onPressed: (){
                      _itemController.deleteNumber(index);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}