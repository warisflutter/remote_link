import 'package:get/get.dart';

import '../controllers/view_camera_controller.dart';

class ViewCameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewCameraController>(
      () => ViewCameraController(),
    );
  }
}
