import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/toolbar.dart';
import '../controllers/view_screen_controller.dart';


class ViewScreenView extends GetView<ViewScreenController> {
  const ViewScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    // We'll use ValueNotifier to track toolbar position
    final toolbarOffset = ValueNotifier<Offset>(Offset(size.width - 100, 150));


    return Scaffold(
      appBar: AppBar(
        title: const Text('iPhone 8'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // ----------------------------
          // CENTER DEVICE IMAGE
          // ----------------------------
          Center(
            child: Container(
              width: 320,
              height: 650,
              padding: const EdgeInsets.fromLTRB(12, 48, 12, 48),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/mobile_device.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // ----------------------------
          // DRAGGABLE TOOLBAR
          // ----------------------------
          ValueListenableBuilder<Offset>(
            valueListenable: toolbarOffset,
            builder: (context, offset, _) {
              // Decide orientation: vertical or horizontal
              bool isVertical = offset.dy > 100 && offset.dy < size.height - 200;

              return AnimatedPositioned(
                duration: const Duration(milliseconds: 5),
                curve: Curves.easeOut,
                left: isVertical ? offset.dx : null,
                top: isVertical ? offset.dy : (offset.dy < size.height / 2 ? 20 : null),
                right: isVertical ? null : 20,
                bottom: isVertical ? null : (offset.dy >= size.height / 2 ? 20 : null),
                child: GestureDetector(
                  onPanUpdate: (details) {
                    double newDx = offset.dx + details.delta.dx;
                    double newDy = offset.dy + details.delta.dy;

                    // Clamp the values inside screen
                    newDx = newDx.clamp(10.0, size.width - 70);
                    newDy = newDy.clamp(10.0, size.height - 70);

                    toolbarOffset.value = Offset(newDx, newDy);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.black54 : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: isDark ? Colors.black45 : Colors.grey.shade300,
                          blurRadius: 6,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: isVertical
                        ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: buildToolbarIcons(isVertical),
                    )
                        : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: buildToolbarIcons(isVertical),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

