
import 'package:temperature_converter/enums/converter_enums.dart';

class TemperatureConversion {
  ConversionType conversionType;
  double value;
  double result;

  TemperatureConversion({
    required this.conversionType,
    required this.value,
    required this.result,
  });
}