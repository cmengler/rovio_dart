import 'package:rovio/src/movement/movement_report.dart';
import 'package:rovio/src/movement/movement_state.dart';
import 'package:rovio/src/response_parser.dart';
import 'package:rovio/src/rovio.dart';

/// Provides movement capabilities for Rovio
class Movement {
  Movement(this.rovio);

  static const String cgiCommand = 'rev.cgi';

  final Rovio rovio;

  Future<MovementReport> getReport() async {
    final response = await rovio.sendRequest('$cgiCommand?Cmd=nav&action=1');
    return MovementReport.fromMap(ResponseParser(response).parse());
  }

  Future<MovementState> getStatus() async {
    final result = await rovio.sendRequest('$cgiCommand?Cmd=nav&action=22');
    return MovementState.values[ResponseParser(result).parse()['state'] as int];
  }

  // TODO(cmengler): Type this response
  Future<void> getTuningParameters() {
    return rovio.sendRequest('$cgiCommand?Cmd=nav&action=16');
  }

  Future<void> goHome() {
    return rovio.sendRequest('$cgiCommand?Cmd=nav&action=12');
  }

  Future<void> goHomeAndDock() {
    return rovio.sendRequest('$cgiCommand?Cmd=nav&action=13');
  }

  Future<void> manualDrive(int driveType, {int? speed, int? angle}) {
    var url = '$cgiCommand?Cmd=nav&action=18&drive=$driveType';
    if (speed != null) {
      url += '&speed=$speed';
    }
    if (angle != null) {
      url += '&angle=$angle';
    }
    return rovio.sendRequest(url);
  }

  Future<void> driveStop() async {
    return manualDrive(0);
  }

  Future<void> driveForward() async {
    return manualDrive(1);
  }

  Future<void> driveBackward() async {
    return manualDrive(2);
  }

  Future<void> driveLeft() async {
    return manualDrive(3);
  }

  Future<void> driveRight() async {
    return manualDrive(4);
  }

  Future<void> rotateLeft({int speed = 1, int? angle}) async {
    return manualDrive(5, speed: speed, angle: angle);
  }

  Future<void> rotateRight({int speed = 1, int? angle}) async {
    return manualDrive(6, speed: speed, angle: angle);
  }

  Future<void> driveDiagonalForwardLeft() async {
    return manualDrive(7);
  }

  Future<void> driveDiagonalForwardRight() async {
    return manualDrive(8);
  }

  Future<void> driveDiagonalBackwardLeft() async {
    return manualDrive(9);
  }

  Future<void> driveDiagonalBackwardRight() async {
    return manualDrive(10);
  }

  Future<void> headUp() async {
    return manualDrive(11);
  }

  Future<void> headDown() {
    return manualDrive(12);
  }

  Future<void> headMiddle() {
    return manualDrive(13);
  }

  Future<void> rotateLeftIncrement({int speed = 1, int? angle}) {
    return manualDrive(17, speed: speed, angle: angle);
  }

  Future<void> rotateRightIncrement({int speed = 1, int? angle}) {
    return manualDrive(18, speed: speed, angle: angle);
  }
}
