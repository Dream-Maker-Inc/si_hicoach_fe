import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _MemberMypageNotificationViewState();
}

class _MemberMypageNotificationViewState extends State<NotificationView> {
  bool isSubmitNotificationSwitched = false;
  bool isChangeNotificationSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '알림 설정'),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: List.of(
            <Widget>[
              ListTile(
                onTap: () {
                  setState(() {
                    isSubmitNotificationSwitched =
                        !isSubmitNotificationSwitched;
                  });
                },
                title: const Text('수업 일지 등록 알림'),
                trailing: Switch(
                  value: isSubmitNotificationSwitched,
                  onChanged: (value) {
                    setState(() => isSubmitNotificationSwitched = value);
                  },
                  activeTrackColor: colorScheme.secondary,
                  activeColor: colorScheme.primary,
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isChangeNotificationSwitched =
                        !isChangeNotificationSwitched;
                  });
                },
                title: const Text('수업 횟수 변경 알림'),
                trailing: Switch(
                  value: isChangeNotificationSwitched,
                  onChanged: (value) {
                    setState(() => isChangeNotificationSwitched = value);
                  },
                  activeTrackColor: colorScheme.secondary,
                  activeColor: colorScheme.primary,
                ),
              ),
            ],
          ),
        ).toList(),
      ),
    );
  }
}
