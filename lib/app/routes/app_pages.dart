import 'package:get/get.dart';

import '../modules/device_detail/bindings/device_detail_binding.dart';
import '../modules/device_detail/views/device_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loading_screen/bindings/loading_screen_binding.dart';
import '../modules/loading_screen/views/loading_screen_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pair_device/bindings/pair_device_binding.dart';
import '../modules/pair_device/views/pair_device_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/verify_screen/bindings/verify_screen_binding.dart';
import '../modules/verify_screen/views/verify_screen_view.dart';
import '../modules/view_camera/bindings/view_camera_binding.dart';
import '../modules/view_camera/views/view_camera_view.dart';
import '../modules/view_screen/bindings/view_screen_binding.dart';
import '../modules/view_screen/views/view_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PAIR_DEVICE,
      page: () => const PairDeviceView(),
      binding: PairDeviceBinding(),
    ),
    GetPage(
      name: _Paths.DEVICE_DETAIL,
      page: () => const DeviceDetailView(),
      binding: DeviceDetailBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_SCREEN,
      page: () => const ViewScreenView(),
      binding: ViewScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_CAMERA,
      page: () => const ViewCameraView(),
      binding: ViewCameraBinding(),
    ),
    GetPage(
      name: _Paths.LOADING_SCREEN,
      page: () => const LoadingScreenView(),
      binding: LoadingScreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_SCREEN,
      page: () => const VerifyScreenView(),
      binding: VerifyScreenBinding(),
    ),
  ];
}
