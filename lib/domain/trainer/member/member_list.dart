import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class TrainerMemberListView extends StatelessWidget {
  const TrainerMemberListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원 관리'),
        leading: IconButton(
          icon: const SizedBox(
            width: 20,
            child: Image(image: AssetImage('assets/icon.png')),
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const SizedBox(
              width: 20,
              child: Icon(Icons.add_rounded),
            ),
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: colorScheme.onTertiary,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(

        ),
      ),
    );
  }
}
