class UpdatePasswordDto {
  String oldPassword;
  String newPassword;

  UpdatePasswordDto({required this.oldPassword, required this.newPassword});

  Map<String, dynamic> toMap() =>
      {'oldPassword': oldPassword, 'newPassword': newPassword};
}
