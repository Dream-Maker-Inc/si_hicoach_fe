import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/account/login/views/login.dart';
import 'package:si_hicoach_fe/domain/member/views/base.dart';
import 'package:si_hicoach_fe/domain/splash/splash_section.dart';
import 'package:si_hicoach_fe/domain/splash/splash_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/base.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    var assetsImage = const AssetImage('assets/splash_logo.png');
    var image = Image(image: assetsImage, width: 96);

    return SplashSection(image: image);
  }
}

class _Detail extends MyGetXState<SplashPage, SplashViewModel> {
  navigateLoginPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  navigateTrainerMainPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const TrainerBaseView()),
    );
  }

  navigateMemberMainPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MemberBaseView()),
    );
  }

  navigateConditionalMainPage() {
    final isTrainer = vm.isRoleTrainer.value;

    if (isTrainer) {
      return navigateTrainerMainPage();
    }

    navigateMemberMainPage();
  }

  @override
  void initState() {
    super.initState();

    vm.isAutoLogin.listen((isAutoLogin) {
      if (isAutoLogin == null) return;

      if (isAutoLogin == false) {
        navigateLoginPage();
        return;
      }

      navigateConditionalMainPage();
    });

    vm.apiError.listen((e) {
      if (e is UnauthorizedException) return;

      Get.defaultDialog(title: 'Error', content: Text(e.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 2500), () => vm.ifAutoLoginThenFlow());

    return widget;
  }

  @override
  SplashViewModel createViewModel() => SplashViewModel();
}
