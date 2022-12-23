import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/account/login/views/login.dart';
import 'package:si_hicoach_fe/domain/member/views/base.dart';
import 'package:si_hicoach_fe/ui/common/splash/splash_section.dart';
import 'package:si_hicoach_fe/ui/common/splash/splash_vm.dart';
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

    const assetsImage = AssetImage('assets/splash_logo.png');
    const image = Image(image: assetsImage, width: 96);

    return const SplashSection(image: image);
  }
}

class _Detail extends MyGetXState<SplashPage, SplashViewModel> {
  _navigateLoginPage() {
    Get.off(const LoginView());
  }

  _navigateTrainerMainPage() {
    Get.off(const TrainerBaseView());
  }

  _navigateMemberMainPage() {
    Get.off(const MemberBaseView());
  }

  _navigateConditionalMainPage() async {
    final isTrainer = await vm.getIsRoleTrainer();

    if (isTrainer) {
      return _navigateTrainerMainPage();
    }

    _navigateMemberMainPage();
  }

  _flow() async {
    final isHaveAccessToken = await vm.getIsHaveAccessToken();

    if (isHaveAccessToken) {
      return _navigateConditionalMainPage();
    }

    _navigateLoginPage();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(milliseconds: 2500),
      () => _flow(),
    );

    return widget;
  }

  @override
  SplashViewModel createViewModel() => SplashViewModel();
}
