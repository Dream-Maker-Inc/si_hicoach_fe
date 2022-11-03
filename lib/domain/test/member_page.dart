import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:si_hicoach_fe/domain/test/member_view.dart';
import 'package:si_hicoach_fe/domain/test/member_vm.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MembersViewModel>(
      create: (_) => MembersViewModel(),
      child: const MembersView(),
    );
  }
}
