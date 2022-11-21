enum StatusCode {
  missingRequiredTerms('TE0001'),
  alreadyUsedEmail('JE0001'),
  notExist('CE0002'),
  existStudy('SE0001'),
  alreadyInBody('SE0003');

  const StatusCode(this.code);

  final String code;
}
