import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class TrainerMainCalendar extends StatelessWidget {
  const TrainerMainCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (int index) => Container(
                color: Colors.white,
                child: SizedBox(
                  width: 58,
                  child: Column(
                    children: <Widget>[
                      const Text(
                        '월',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorScheme.primary,
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            '11',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color.fromRGBO(255, 255, 255, 0),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 0),
                  Colors.white,
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
