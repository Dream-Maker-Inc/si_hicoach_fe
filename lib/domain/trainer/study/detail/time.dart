import 'package:flutter/cupertino.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class TrainerStudyDetailTime extends StatelessWidget {
  const TrainerStudyDetailTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          width: double.infinity,
          child: Text(
            '수업 시간',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 6,
                  bottom: 6,
                ),
                child: Text(
                  '오전 11:00',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 20),
              child: Text(
                '부터',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromRGBO(70, 103, 240, 0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 6,
                  bottom: 6,
                ),
                child: Text(
                  '오전 11:50',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('까지', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ],
    );
  }
}
