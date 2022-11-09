import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';

class CustomAppBarWithLogo extends StatelessWidget
    implements PreferredSizeWidget {
  final String titleText;
  final List<Widget>? actionsWidget;

  const CustomAppBarWithLogo({
    Key? key,
    required this.titleText,
    this.actionsWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      leading: IconButton(
        icon: const SizedBox(
          width: 20,
          child: Image(
            image: AssetImage('assets/icon.png'),
          ),
        ),
        onPressed: () {},
      ),
      actions: actionsWidget,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: CustomDivider(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
