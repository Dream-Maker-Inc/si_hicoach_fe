import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/notification/notification_types.dart';
import 'package:si_hicoach_fe/ui/member/my_page/notification/notification_vm.dart';

class MemberNotificationView extends StatefulWidget {
  const MemberNotificationView({Key? key}) : super(key: key);

  @override
  State<MemberNotificationView> createState() => _MemberNotificationViewState();
}

class _MemberNotificationViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '알림 설정'),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: List.of(
            <Widget>[
              _buildStudyCreatedNotifi(),
              _buildTicketCountChageNotifi(),
            ],
          ),
        ).toList(),
      ),
    );
  }

  _buildTicketCountChageNotifi() {
    return Obx(() {
      final isAllow = vm.isTicketCountChangeNotifiAllow;

      return ListTile(
        onTap: () {
          handleTicketCountChangeNotifiAllow();
        },
        title: const Text('수업 횟수 변경 알림'),
        trailing: Switch(
          value: isAllow,
          onChanged: (value) {
            handleTicketCountChangeNotifiAllow();
          },
          activeTrackColor: secondaryColor,
          activeColor: primaryColor,
        ),
      );
    });
  }

  _buildStudyCreatedNotifi() {
    return Obx(() {
      final isAllow = vm.isStudyCreatedNotifiAllow;

      return ListTile(
        onTap: () {
          handleStudyCreateNotifiAllow();
        },
        title: const Text('수업 일지 등록 알림'),
        trailing: Switch(
          value: isAllow,
          onChanged: (value) {
            handleStudyCreateNotifiAllow();
          },
          activeTrackColor: secondaryColor,
          activeColor: primaryColor,
        ),
      );
    });
  }
}

class _Detail
    extends MyGetXState<MemberNotificationView, MemberNotificationViewModel> {
  handleTicketCountChangeNotifiAllow() {
    vm.toggleNotifiAllow(PushNotifiTypes.changedTicketCount);
  }

  handleStudyCreateNotifiAllow() {
    vm.toggleNotifiAllow(PushNotifiTypes.createStudy);
  }

  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.fetchAgreedNotifiList();
    });

    return widget;
  }

  @override
  MemberNotificationViewModel createViewModel() =>
      MemberNotificationViewModel();
}
