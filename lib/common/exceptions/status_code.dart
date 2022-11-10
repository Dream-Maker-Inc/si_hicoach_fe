enum StatusCode {
  missingRequiredTerms('TE0001'), alreadyUsedEmail('JE0001');

  const StatusCode(this.code);
  final String code;
}