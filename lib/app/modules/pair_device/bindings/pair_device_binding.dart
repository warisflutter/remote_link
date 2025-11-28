import 'package:get/get.dart';

import '../controllers/pair_device_controller.dart';

class PairDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PairDeviceController>(
      () => PairDeviceController(),
    );
  }
}
