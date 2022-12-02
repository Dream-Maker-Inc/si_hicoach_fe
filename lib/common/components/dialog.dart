import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

class MySimpleDialogProps {
  String title;
  String content;
  String cancelText;
  String confirmText;
  Color? cancelColor;
  Color? confirmColor;
  VoidCallback? onCancel;
  Function()? onConfirm;

  MySimpleDialogProps(
      {required this.title,
      required this.content,
      this.cancelText = "취소",
      this.confirmText = "확인",
      this.cancelColor,
      this.confirmColor,
      this.onCancel,
      this.onConfirm});
}

class MySimpleDialog extends StatelessWidget {
  final MySimpleDialogProps props;

  const MySimpleDialog({super.key, required this.props});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(props.title),
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(props.content),
              Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [_buildCancelButton(), _buildConfirmButton()],
                  ))
            ],
          ),
        )
      ],
    );
  }

  _buildCancelButton() {
    final onCancel = props.onCancel;
    final cancelColor = props.cancelColor ?? Colors.grey.shade600;

    if (onCancel == null) return Container();

    return TextButton(
        onPressed: () => onCancel(),
        child: Text(
          props.cancelText,
          style: TextStyle(color: cancelColor),
        ));
  }

  _buildConfirmButton() {
    final onConfirm = props.onConfirm;
    final confirmColor = props.cancelColor ?? primaryColor;

    if (onConfirm == null) return Container();

    return TextButton(
        onPressed: () => onConfirm(),
        child: Text(
          props.confirmText,
          style: TextStyle(color: confirmColor),
        ));
  }
}

void showMySimpleDialog(
    {required BuildContext context,
    required String title,
    required String content,
    String cancelText = "취소",
    String confirmText = "확인",
    Color? cancelColor,
    Color? confirmColor,
    VoidCallback? onCancel,
    Function()? onConfirm}) {
  final props = MySimpleDialogProps(
      title: title,
      content: content,
      cancelText: cancelText,
      confirmText: confirmText,
      cancelColor: cancelColor,
      confirmColor: confirmColor,
      onCancel: onCancel,
      onConfirm: onConfirm);

  final isNotVisibleButton = (onCancel == null) || (onConfirm == null);

  showDialog(
      context: context,
      barrierDismissible: isNotVisibleButton,
      builder: (BuildContext context) => MySimpleDialog(props: props));
}
