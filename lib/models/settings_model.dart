class SettingsModel {
  final String name;
  final String imageAddress;
  SettingsModel({required this.name, required this.imageAddress});
}

List<SettingsModel> settingsModelList = [
  SettingsModel(
      name: 'App Theme', imageAddress: 'assets/images/Choose_theme-512.webp'),
  SettingsModel(
      name: 'Notifications', imageAddress: 'assets/images/notification.png'),
  SettingsModel(
      name: 'Change Language', imageAddress: 'assets/images/Language_icon.png'),
  SettingsModel(
      name: 'About', imageAddress: 'assets/images/Very-Basic-About-icon.png'),
];
