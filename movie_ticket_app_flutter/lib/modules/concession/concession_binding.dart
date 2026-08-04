import 'package:get/get.dart';
import 'concession_controller.dart';

class ConcessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConcessionController>(() => ConcessionController());
  }
}