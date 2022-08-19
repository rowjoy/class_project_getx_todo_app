import 'package:flutter_provider/mode/model.dart';
import 'package:get/get.dart';

class ItemController extends GetxController{
  var numberList = <NumberModel>[].obs;

  addNumber(NumberModel numberModel){
    numberList.add(numberModel);
  }

  deleteNumber(index){
    numberList.removeAt(index);
  }
  
}