import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/common/text_styles.dart';
import 'package:si_hicoach_fe/domain/common/trainer/bottom_navigation_bar.dart';
import 'package:si_hicoach_fe/domain/trainer/main/calendar.dart';
import 'package:si_hicoach_fe/domain/trainer/main/hello.dart';
import 'package:si_hicoach_fe/domain/trainer/main/todo_item.dart';

class TrainerMainView extends StatefulWidget {
  const TrainerMainView({Key? key}) : super(key: key);

  @override
  State<TrainerMainView> createState() => _TrainerMainViewState();
}

class _TrainerMainViewState extends State<TrainerMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인'),
        leading: IconButton(
          icon: const SizedBox(
            width: 20,
            child: Image(image: AssetImage('assets/icon.png')),
          ),
          onPressed: () {},
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: colorScheme.onTertiary,
            height: 1,
          ),
        ),
      ),
      bottomNavigationBar: const TrainerBottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const TrainerMainHello(),
              const SizedBox(height: widePadding),
              const TrainerMainCalendar(),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey.shade200,
                indent: defaultPadding,
                endIndent: defaultPadding,
              ),
              const TrainerMainTodoItem(),
            ],
          ),
        ),
      ),
    );
  }
}
