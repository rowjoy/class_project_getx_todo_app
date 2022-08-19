import 'package:flutter_provider/mode/model.dart';
import 'package:get/get.dart';

// class ItemController extends GetxController{
//   // var numberList = <NumberModel>[].obs;

//   // addNumber(NumberModel numberModel){
//   //   numberList.add(numberModel);
//   // }

//   // deleteNumber(index){
//   //   numberList.removeAt(index);
//   // }
  
// }


class NumberListController extends GetxController{
  var numberlist = <NumberModel>[].obs;
  var name = "".obs;

  addNumber(NumberModel numberModel){
    numberlist.add(numberModel);
    
  }

  deleteNumber(index){
    numberlist.removeAt(index);
  }

}