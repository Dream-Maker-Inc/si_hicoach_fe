import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class TrainerMypageEditPasswordView extends StatelessWidget {
  const TrainerMypageEditPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '비밀번호 변경',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check_rounded,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '기존 비밀번호',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: smallPadding),
            Text(
              '기존 비밀번호를 입력해 주세요.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: smallPadding),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.primary),
                ),
                labelText: '비밀번호 입력',
              ),
            ),
            const SizedBox(height: widePadding),
            Text(
              '변경할 비밀번호',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: smallPadding),
            Text(
              '변경할 비밀번호를 입력해 주세요.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: smallPadding),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.primary),
                ),
                labelText: '비밀번호 입력',
              ),
            ),
            const SizedBox(height: widePadding),
            Text(
              '변경할 비밀번호 확인',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: smallPadding),
            Text(
              '변경할 비밀번호를 한번 더 입력해 주세요.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: smallPadding),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.primary),
                ),
                labelText: '비밀번호 입력',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
