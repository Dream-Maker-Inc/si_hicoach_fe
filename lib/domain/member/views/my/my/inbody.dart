import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

class MemberInbodyView extends StatelessWidget {
  const MemberInbodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '인바디 데이터'),
      body: GridView.count(
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: 40,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(defaultPadding),
        children: List.generate(
          30,
          (int index) => Column(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  'https://www.gymgair.co.uk/wp-content/uploads/2019/11/270rs-English.jpg',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '2022년 10월 11일',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
