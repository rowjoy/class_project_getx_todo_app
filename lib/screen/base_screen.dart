// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names, avoid_unnecessary_containers, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider/controller/item_controller.dart';
import 'package:flutter_provider/mode/model.dart';
import 'package:flutter_provider/screen/item_list_screen.dart';
import 'package:get/get.dart';

import '../utils/controller.dart';
class BaseScreen extends StatelessWidget {
 BaseScreen({ Key? key }) : super(key: key);
  final ItemController _itemController = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextField(
                controller: ControllerData.nameController,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                keyboardType: TextInputType.number,
                controller: ControllerData.numberController,
                decoration: InputDecoration(
                  hintText: "Enter your Phone number",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: ElevatedButton(
                  onPressed: (){
                    _itemController.addNumber(
                      NumberModel(
                        name: ControllerData.nameController.text,
                        number: ControllerData.numberController.text,
                      ),
                    );

                    ControllerData.nameController.clear();
                    ControllerData.numberController.clear();
                  },
                  child: Text("Save"),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text("Number list"),
                  InkWell(
                    child: Text("View all"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ListViewNumber()));
                    },
                  )
                ],
              ),
              Expanded(
                child: Container(
                  child: Obx(()=> ListView.builder(
                      itemCount: _itemController.numberList.length,
                      itemBuilder: (BuildContext  context , index){
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.primaries[Random().nextInt(17)],
                          ),
                          title: Text("${_itemController.numberList[index].name}"),
                          subtitle: Text("${_itemController.numberList[index].number}"),
                          trailing: IconButton(
                            onPressed: (){
                              ControllerData.nameController.text =  _itemController.numberList[index].name.toString();
                              ControllerData.numberController.text = _itemController.numberList[index].number;
                              _itemController.deleteNumber(index);
                            }, 
                            icon: Icon(Icons.edit),
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}