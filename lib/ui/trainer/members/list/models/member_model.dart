class MemberModel {
  final int id;
  final String name;
  final String matchedDate;
  final int latestStudyRound;
  final int totalTicketCount;
  final int matchingId;
  final bool isTrainer;

  MemberModel({
    required this.id,
    required this.name,
    required this.matchedDate,
    required this.latestStudyRound,
    required this.totalTicketCount,
    required this.matchingId,
    this.isTrainer = false,
  });
}
