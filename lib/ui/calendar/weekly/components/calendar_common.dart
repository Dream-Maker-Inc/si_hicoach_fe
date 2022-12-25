import 'package:flutter/material.dart';

// 캘린더 테두리
final calendarBorder = BorderSide(
  width: 1,
  color: Colors.grey.shade300,
);

// 캘린더 콘텐츠 아이템 height
const double calendarItemHeight = 50;

// 캘린더 헤더 아이템 height
const double calendarHeaderHeight = 26;

// 캘린더 시간 아이템 width
getTimeItemWidth(BuildContext context) {
  return MediaQuery.of(context).size.width / 20;
}
