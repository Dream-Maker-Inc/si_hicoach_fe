import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '사업자 정보'),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('상호'),
            trailing: Text(
              '오르다',
              style: labelLarge.copyWith(color: Colors.grey),
            ),
          ),
          const CustomDivider(),
          ListTile(
            title: const Text('주소'),
            trailing: Text(
              '서울 서대문구 연세로2나길 61',
              style: labelLarge.copyWith(color: Colors.grey),
            ),
          ),
          const CustomDivider(),
          ListTile(
            title: const Text('사업자등록번호'),
            trailing: Text(
              '213-64-00627',
              style: labelLarge.copyWith(color: Colors.grey),
            ),
          ),
          const CustomDivider(),
          ListTile(
            title: const Text('대표자명'),
            trailing: Text(
              '오지현',
              style: labelLarge.copyWith(color: Colors.grey),
            ),
          ),
          const CustomDivider(),
          ListTile(
            title: const Text('유선전화번호'),
            trailing: Text(
              '02-824-5695',
              style: labelLarge.copyWith(color: Colors.grey),
            ),
          ),
          const CustomDivider(),
        ],
      ),
    );
  }
}
