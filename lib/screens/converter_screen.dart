import 'package:flutter/material.dart';
import 'package:temperature_converter/enums/converter_enums.dart';
import 'package:temperature_converter/models/converter_models.dart';
import 'package:temperature_converter/utils/converter_utils.dart';
import 'package:temperature_converter/widgets/conversion_history.dart';
import 'package:temperature_converter/widgets/temperature_converter.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  final List<TemperatureConversion> _history = List.empty(growable: true);

  void _convert(double? inputValue, ConversionType conversionType) {
    if (inputValue != null) {
      switch (conversionType) {
        case ConversionType.fahrenheitToCelsius:
          setState(() {
            _history.add(
              TemperatureConversion(
                conversionType: conversionType,
                value: inputValue,
                result: fahrenheitToCelsius(inputValue),
              ),
            );
          });
          break;
        case ConversionType.celsiusToFahrenheit:
          setState(() {
            _history.add(
              TemperatureConversion(
                conversionType: conversionType,
                value: inputValue,
                result: celciusToFahrenheit(inputValue),
              ),
            );
          });
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Converter",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Container(
              padding: const EdgeInsets.all(10),
              child:
                  orientation == Orientation.portrait
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TemperatureConverter(
                            convertedValue:
                                _history.isNotEmpty
                                    ? _history.last.result.toStringAsFixed(2)
                                    : "",
                            convert: _convert,
                          ),
                          Expanded(child: ConversionHistory(history: _history)),
                        ],
                      )
                      : Row(
                        children: [
                          Expanded(
                            child: TemperatureConverter(
                              convertedValue:
                                  _history.isNotEmpty
                                      ? _history.last.result.toStringAsFixed(2)
                                      : "",
                              convert: _convert,
                            ),
                          ),
                          Expanded(child: ConversionHistory(history: _history)),
                        ],
                      ),
            );
          },
        ),
      ),
    );
  }
}
