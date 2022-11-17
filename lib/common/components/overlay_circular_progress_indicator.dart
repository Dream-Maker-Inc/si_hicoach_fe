import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

/// message 가 null 이 아니면 로딩중 상태.
class OverlayCircularProgressIndicator extends StatelessWidget {
  final Widget child;
  final String? message;

  bool get isLoading => message != null;

  const OverlayCircularProgressIndicator(
      {super.key, required this.child, this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (isLoading)
          Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 24),
              if (message != null)
                DefaultTextStyle(
                    style: bodyLarge.copyWith(color: Colors.white),
                    child: Text(message ?? "")),
            ]),
          ),
      ],
    );
  }
}
