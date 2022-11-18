class SimpleTime {
  int hour;
  int minute;

  SimpleTime({required this.hour, this.minute = 0});

  _toTwoDigitOrNothing(int number) => (number > 9) ? '$number' : '0$number';

  getTime() {
    return "$hour시 $minute분";
  }

  getStudyEndTime() {
    return "$hour시 50분";
  }
}
