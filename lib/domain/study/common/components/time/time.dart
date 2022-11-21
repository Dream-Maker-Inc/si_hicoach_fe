import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/simple_time.dart';

class EditTimeModel {
  final SimpleTime time;
  final int studyRound;
  final int totalStudyCount;

  EditTimeModel({
    required this.time,
    required this.studyRound,
    required this.totalStudyCount,
  });
}

class EditTime extends StatelessWidget {
  EditTime({
    Key? key,
    required this.model,
    required this.onTimeSelect,
  }) : super(key: key);

  final EditTimeModel model;
  final Function(SimpleTime time) onTimeSelect;

  final times = List.generate(24, ((index) => SimpleTime(hour: index)));

  _handleTimePickerTapped(BuildContext ctx) async {
    showCupertinoModalPopup(
        context: ctx,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(ctx).size.height * 0.25,
            color: Colors.white,
            child: CupertinoPicker(
                itemExtent: 60,
                onSelectedItemChanged: _handleTimeSelect,
                children: _buildTimes()),
          );
        });
  }

  _handleTimeSelect(int index) {
    onTimeSelect(times[index]);
  }

  @override
  Widget build(BuildContext context) {
    final time = model.time;
    final studyRound = model.studyRound;
    final totalStudyCount = model.totalStudyCount;

    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                '수업 시간',
                style: titleLarge.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '$studyRound회차 ($totalStudyCount회)',
                  style: bodySmall.copyWith(
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromRGBO(70, 103, 240, 0.1),
                ),
                child: LayoutBuilder(
                  builder: (ctx, constraints) {
                    return InkWell(
                      onTap: () => _handleTimePickerTapped(ctx),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 6,
                          bottom: 6,
                        ),
                        child: Text(
                          time.getTime(),
                          style: bodySmall.copyWith(color: primaryColor),
                        ),
                      ),
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Text('부터', style: bodySmall),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Colors.grey.shade100,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 6,
                  bottom: 6,
                ),
                child: Text(time.getStudyEndTime(), style: bodySmall),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('까지', style: bodySmall),
            ),
          ],
        ),
      ],
    );
  }

  _buildTimes() =>
      times.map((it) => Center(child: Text(it.getTime()))).toList();
}
