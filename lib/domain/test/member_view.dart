import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_hicoach_fe/domain/test/member_vm.dart';

class MembersView extends StatefulWidget {
  const MembersView({Key? key}) : super(key: key);

  @override
  State<MembersView> createState() => _MembersViewState();
}

class _MembersViewState extends State<MembersView> {
  late MembersViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<MembersViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Member List')),
      body: _buildMembers(),
    );
  }

  Widget _buildMembers() {
    final items = viewModel.items;
    final itemCount = items.length;

    return ListView.builder(
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item.name),
          onTap: () => _handleMemberClick(item.id),
        );
      },
      itemCount: itemCount,
    );
  }

  _handleMemberClick(String memberId) async {
    var isSuccessMemberDelete = await viewModel.deleteItem(memberId);
    var message = isSuccessMemberDelete ? '멤버 삭제 성공' : '멤버 삭제 실패';

    var dialog = AlertDialog(
      title: const Text("알림"),
      content: Text(message),
    );

    showDialog(context: context, builder: (BuildContext ctx) => dialog);
  }
}
