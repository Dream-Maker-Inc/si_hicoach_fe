import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension GetXStateExtension on MyGetXState {
  rebuildViewModel<T extends GetxController>(T controller) {
    Get.delete<T>();
    vm = Get.put<T>(controller);
  }
}

abstract class MyGetXState<T extends StatefulWidget, K extends GetxController>
    extends State<T> {
  late K vm;

  K createViewModel();

  @override
  void initState() {
    super.initState();

    rebuildViewModel<K>(createViewModel());
  }
}
