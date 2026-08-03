import 'package:get/get.dart';
import 'seat_selection_controller.dart';

class SeatSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeatSelectionController>(() => SeatSelectionController());
  }
}