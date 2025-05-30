## Temperature Converter

A temperature conversion mobile application to allow the user to select either Fahrenheit-to-Celsius or Celsius-to-Fahrenheit conversions. The app is written in flutter.

### Prerequisites

In order to contribute to or run this application, the following tools and dependecies must be installed:

1. Flutter v3.7.2
2. Android/iOS build tools
3. Emulator (Android/iOS) or physical mobile device

### Set Up

1. Clone the project: `git clone https://github.com/degide/temperature-converter.git`
2. Navigate to source root folder: `cd temperature-converter`
3. Install dependencies: `flutter pub get`
4. Run the app on a device: `flutter run`

### Directory structure

- `main.dart` The main entry of our application
- `lib` The library folder
  - `enums` Enumerations
    - `converter_enums.dart` Contains `ConversionType` enum.
  - `screens` Application screens/scenes widgets
    - `converter_screen.dart` The temperature converter main screen widget
  - `utils` The utilities folder
    - `converter_utils.dart` Contains utility functions for our converter app
  - `widgets` App custom widgets
    - `converter_history.dart` Temperatur conversion history widget.
    - `temperature_converter.dart` The temperature converter widget

### Flutter Resources

A few resources to get you started if this is your Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Contributors
1. [degide <h.egide@alustudent.com>](https://github.com/degide)