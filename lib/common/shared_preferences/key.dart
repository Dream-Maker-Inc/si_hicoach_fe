enum SharedPrefsKeys {
  accessToken('access_token'),
  id('id'),
  userName('user_name'),
  isRoleTrainer('is_role_trainer');

  const SharedPrefsKeys(this.key);
  final String key;
}
