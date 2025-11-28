import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_link/app/core/colors.dart';
import 'package:remote_link/app/data/helper/device_card.dart';
import 'package:remote_link/app/modules/device_detail/views/device_detail_view.dart';
import 'package:remote_link/app/routes/app_pages.dart';
import '../../pair_device/controllers/pair_device_controller.dart';
import '../../pair_device/views/pair_device_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Connected Devices",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 20,),

                Expanded(
                  child: ListView(
                    children: [
                      DeviceCard(
                          title: "Living Room TV",
                          status: "Active 5m ago",
                          isOnline: true,
                          icon: Icons.wifi,
                        onTap: () {
                            Get.to(() => DeviceDetailView(),
                              transition: Transition.rightToLeft,
                              duration: Duration(milliseconds: 300),
                            );
                        },
                      ),
                      DeviceCard(
                        title: "Bedroom Speaker",
                        status: "Last seen 2h ago",
                        isOnline: false,
                        icon: Icons.signal_cellular_alt,
                        onTap: () {
                          Get.to(() => DeviceDetailView(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 300),
                          );
                        },
                      ),
                      DeviceCard(
                        title: "Office Computer",
                        status: "Active 1m ago",
                        isOnline: true,
                        icon: Icons.wifi,
                      ),
                      DeviceCard(
                        title: "Kitchen Display",
                        status: "Last seen 1d ago",
                        isOnline: false,
                        icon: Icons.wifi_off,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Get.to(
                () => const PairDeviceView(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => PairDeviceController());
            }),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 300),
          );
        },

        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 28, color: Colors.white),
      ),
    );
  }
}

