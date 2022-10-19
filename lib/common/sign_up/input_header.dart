import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants.dart';

class SignUpInputHeader extends StatelessWidget {
  final String title;
  final String description;

  const SignUpInputHeader({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
