class MovementReport {
  MovementReport({
    required this.micVolume,
    required this.speakerVolume,
    required this.battery,
    required this.charging,
  });

  factory MovementReport.fromMap(Map<String, dynamic> map) {
    return MovementReport(
      micVolume: map['micVolume'] as int,
      speakerVolume: map['speakerVolume'] as int,
      battery: map['battery'] as int,
      charging: map['charging'] as int,
    );
  }

  final int micVolume;
  final int speakerVolume;
  final int battery;
  final int charging;

  @override
  String toString() {
    return 'MovementReport(micVolume: $micVolume, speakerVolume: $speakerVolume, battery: $battery, charging: $charging)';
  }
}
