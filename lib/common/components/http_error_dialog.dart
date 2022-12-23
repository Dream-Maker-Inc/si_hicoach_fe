import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MyHttpErrorDialog extends StatefulWidget {
  final String errorMsg;

  const MyHttpErrorDialog({super.key, this.errorMsg = ""});

  @override
  State<MyHttpErrorDialog> createState() => _MyHttpErrorDialogState();
}

class _MyHttpErrorDialogState extends State<MyHttpErrorDialog> {
  String get errorMsg => widget.errorMsg;
  bool _isVisibleErrorMsg = false;

  _toggleVisibleErrorMsg() {
    setState(() {
      _isVisibleErrorMsg = !_isVisibleErrorMsg;
    });
  }

  _handleErrorMsgCopy() {
    Clipboard.setData(ClipboardData(text: errorMsg));
    Get.back();

    Get.snackbar(
      "클립보드에 복사",
      "에러 내용이 클립보드에 복사되었어요!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white.withOpacity(0.9),
      borderWidth: 1,
      borderColor: Colors.grey.shade400.withOpacity(0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    Logger().e(errorMsg);

    return SimpleDialog(
      title: _buildTitleSection(),
      clipBehavior: Clip.hardEdge,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAnnouncementMessageSection(),
            const SizedBox(height: 12),
            Column(
              children: [
                _buildMoreButton(),
                _buildErrorMessageSection(),
              ],
            )
          ],
        )
      ],
    );
  }

  _buildTitleSection() => const Text("연결 실패");

  _buildErrorMessageSection() {
    if (!_isVisibleErrorMsg) return Container();

    return SizedBox(
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: InkWell(
          onTap: _handleErrorMsgCopy,
          child: Container(
            width: double.infinity,
            padding: _getDefaultEdgeInsets(),
            child: Text(errorMsg),
          ),
        ),
      ),
    );
  }

  _buildMoreButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 1,
            color: Colors.grey.shade400.withOpacity(0.3),
          ),
        ),
      ),
      child: InkWell(
        onTap: _toggleVisibleErrorMsg,
        child: Container(
          width: double.infinity,
          padding: _getDefaultEdgeInsets(),
          child: const Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.6,
              child: Text("더보기"),
            ),
          ),
        ),
      ),
    );
  }

  _buildAnnouncementMessageSection() {
    return Padding(
      padding: _getDefaultEdgeInsets(),
      child: Text(
        "서버와 연결에 실패했어요.\n잠시후 다시 시도해주세요.",
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }

  _getDefaultEdgeInsets() {
    return const EdgeInsets.only(
      left: 24,
      right: 24,
      top: 8,
      bottom: 8,
    );
  }
}

//
showMyHttpErrorDialog(String e) {
  Get.dialog(MyHttpErrorDialog(errorMsg: e));
}
