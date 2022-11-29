import 'package:get/get.dart';

class MainPageViewModel extends _FetchController {
  RxInt tabIndex = RxInt(0);
}

class _FetchController extends GetxController {
  //
  Rx<Exception?> apiError = Rx(null);
}
