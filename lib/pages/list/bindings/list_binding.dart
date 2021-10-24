
import 'package:get/get.dart';
import 'package:mytimetrackerapp/pages/list/controllers/count_controller.dart';
import 'package:mytimetrackerapp/pages/list/controllers/list_controller.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListController());
    Get.put(CountController());
  }
}