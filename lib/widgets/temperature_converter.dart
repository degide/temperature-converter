import 'package:flutter/material.dart';

import '../enums/converter_enums.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({
    super.key,
    required this.convert,
    this.convertedValue,
  });
  final String? convertedValue;
  final Function(double? inputValue, ConversionType conversionType) convert;

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  ConversionType _conversionType = ConversionType.fahrenheitToCelsius;
  double? _inputValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: const Text(
            "Conversion:",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
              value: ConversionType.fahrenheitToCelsius,
              groupValue: _conversionType,
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _conversionType = val;
                  });
                }
              },
            ),
            const Text("Fahrenheit to Celsius", style: TextStyle(fontSize: 13)),
            Radio(
              value: ConversionType.celsiusToFahrenheit,
              groupValue: _conversionType,
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _conversionType = val;
                  });
                }
              },
            ),
            const Text("Celsius to Fahrenheit", style: TextStyle(fontSize: 13)),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText:
                        _conversionType == ConversionType.fahrenheitToCelsius
                            ? 'F'
                            : '°C',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _inputValue = double.tryParse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "=",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    widget.convertedValue ?? (_conversionType == ConversionType.celsiusToFahrenheit ? "F" : "°C"),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
            child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              clipBehavior: Clip.hardEdge,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                widget.convert(_inputValue, _conversionType);
              },
              child: const Text(
                'CONVERT',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
