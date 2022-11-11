enum StatusCode {
  missingRequiredTerms('TE0001'),
  alreadyUsedEmail('JE0001'),
  notExist('CE0002');

  const StatusCode(this.code);

  final String code;
}
