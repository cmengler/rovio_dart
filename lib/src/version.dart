/// Version of Rovio firmware
///
/// Example:
/// Version = Jan 14 2009 16:27:05 $Revision: 5.3131$
class Version {
  Version(String version) {
    final matches = versionRegex.firstMatch(version);
    date = matches?.group(1);
    firmware = matches?.group(2);
  }

  static final versionRegex = RegExp(r'Version = (.*) \$Revision: (.*)\$');

  /// The date of the firmware
  late String? date;

  /// The version of the firmware
  late String? firmware;

  @override
  String toString() => 'Version(date: $date, firmware: $firmware)';
}
