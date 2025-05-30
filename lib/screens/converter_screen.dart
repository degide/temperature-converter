import 'package:flutter/material.dart';
import 'package:temperature_converter/enums/converter_enums.dart';
import 'package:temperature_converter/models/converter_models.dart';
import 'package:temperature_converter/utils/converter_utils.dart';
import 'package:temperature_converter/widgets/conversion_history.dart';
import 'package:temperature_converter/widgets/temperature_converter.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() => _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
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

  void _clearHistory(){
    setState(() {
      _history.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature Conversion"),
        centerTitle: true,
        toolbarHeight: 50,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
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
                                    : null,
                            convert: _convert,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: ConversionHistory(
                                history: _history, 
                                clearHistory: _clearHistory,
                              ),
                            ),
                          ),
                        ],
                      )
                      : Row(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: TemperatureConverter(
                                  convertedValue:
                                      _history.isNotEmpty
                                          ? _history.last.result.toStringAsFixed(2)
                                          : null,
                                  convert: _convert,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ConversionHistory(
                                  history: _history,
                                  clearHistory: _clearHistory,
                                ),
                              ),
                            ),
                          ],
                        ),
            );
          },
        ),
      ),
    );
  }
}
