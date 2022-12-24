enum PushNotifiTypes {
  createStudy('CraetedStudy'),
  changedTicketCount('ChangedTicketCount');

  const PushNotifiTypes(this.key);

  final String key;
}
