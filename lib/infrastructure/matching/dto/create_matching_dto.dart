class CreateMatchingDto {
  int memberId;
  List<String> goals;
  String memo;
  int totalTicketCount;
  int finishedTicketCount;

  CreateMatchingDto(
      {required this.memberId,
      required this.goals,
      required this.memo,
      required this.totalTicketCount,
      required this.finishedTicketCount});

  Map<String, dynamic> toMap() {
    return {
      'memberId': memberId,
      'goals': goals,
      'memo': memo,
      'totalTicketCount': totalTicketCount,
      'finishedTicketCount': finishedTicketCount
    };
  }
}
