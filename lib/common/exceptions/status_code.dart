enum StatusCode {
  missingRequiredTerms('TE0001');

  const StatusCode(this.code);
  final String code;
}