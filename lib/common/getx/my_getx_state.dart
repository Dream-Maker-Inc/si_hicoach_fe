import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyGetXState<T extends StatefulWidget, K extends GetxController>
    extends State<T> {
  late K vm;

  K createViewModel();

  @override
  void initState() {
    super.initState();

    vm = Get.put<K>(createViewModel());
  }
}
