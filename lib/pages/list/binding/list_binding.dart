
import 'package:get/get.dart';
import 'package:mytimetrackerapp/pages/list/view/controller/list_controller.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListController());
  }
}