/// The state of Rovio movement
enum MovementState {
  /// Idle
  /// Status code 0
  idle,

  /// Rovio is current driving back to home base
  /// Status code 1
  drivingHome,

  /// Rovio is docking
  /// Status code 2
  docking,

  /// Rovio is executing a recorded path
  /// Status code 3
  executingPath,

  /// Rovio is recording a path
  /// Status code 4
  recordingPath,
}
