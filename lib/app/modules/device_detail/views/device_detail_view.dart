import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remote_link/app/core/colors.dart';
import 'package:remote_link/app/modules/view_camera/views/view_camera_view.dart';
import 'package:remote_link/app/modules/view_screen/views/view_screen_view.dart';

import '../../../widget/setting_tile.dart';
import '../controllers/device_detail_controller.dart';

class DeviceDetailView extends GetView<DeviceDetailController> {
  const DeviceDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: theme.iconTheme.color,
            ),
            onPressed: ()=> Get.back()),
        title: Text(
            "Device Detail",
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4), // Border width
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white   // DARK theme border
                        : Colors.black87, // LIGHT theme border
                    width: 1,
                  ),
                ),
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.transparent,
                  backgroundImage: const AssetImage("assets/images/device.png"),
                ),
              ),

              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "INFINIX NOTE 12",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 8,),
                  Icon(
                    Icons.edit,
                    color: AppColors.primary,
                  )
                ],
              ),

              SizedBox(height: 8,),
              Text(
                "Online • Battery: 84%",
                style: TextStyle(
                  color: theme.textTheme.bodyMedium?.color,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 25),

              // ---------- Settings Box ----------
              Container(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [

                    buildSettingTile(
                      theme,
                      icon: Icons.crop_free,
                      title: "Enable Screen Control",
                      switchValue: true,
                      onChanged: (v) {},
                      onTap: () {
                        Get.to(()=> ViewScreenView(),
                        transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 300)
                        );
                      }
                    ),

                    buildDivider(),

                    buildSettingTile(
                      theme,
                      icon: Icons.camera_alt,
                      title: "Camera Access",
                      switchValue: true,
                      onChanged: (v) {},
                      onTap: () {
                        Get.to(() => ViewCameraView(),
                        transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 300),
                        );
                      }
                    ),

                    buildDivider(),

                    buildSettingTile(
                      theme,
                      icon: Icons.mic,
                      title: "Microphone Access",
                      switchValue: false,
                      onChanged: (v) {},
                    ),

                    buildDivider(),

                    buildSettingTile(
                      theme,
                      icon: Icons.sync_alt,
                      title: "Background Data",
                      switchValue: true,
                      onChanged: (v) {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "DANGER ZONE",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    color: Colors.red.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.delete, color: Colors.red, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        "Remove Device",
                        style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
