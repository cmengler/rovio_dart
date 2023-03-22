# Rovio

[![Pub Version](https://img.shields.io/pub/v/rovio?color=blueviolet)](https://pub.dev/packages/rovio)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A Dart package for the Rovio WowWee API.

## Installation

Add `rovio` to your `pubspec.yaml`:

```yaml
dependencies:
  rovio:
```

Install it:

```sh
dart pub get
```

## Usage

Create the `Rovio` client:

```dart
import 'package:rovio/rovio.dart';

final rovio = Rovio(
  host: 'xxx.xxx.xxx.xxx',
  port: 80,
  username: 'admin',
  password: 'xxx',
)
```

### Movement

```dart
// Drive forward
rovio.movement.driveForward();

// Stop driving
rovio.movement.driveStop();
```

### Camera

TBC.

### Audio

TBC.

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
