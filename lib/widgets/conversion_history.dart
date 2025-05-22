import 'package:flutter/material.dart';

import '../enums/converter_enums.dart';
import '../models/converter_models.dart';

class ConversionHistory extends StatelessWidget {
  const ConversionHistory({
    super.key,
    required List<TemperatureConversion> history,
  }) : _history = history;

  final List<TemperatureConversion> _history;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: List.of([BoxShadow(color: Colors.black)]),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400, width: 2),
      ),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: _history.length,
        itemBuilder: (context, index) {
          final entry = _history[index];
          return ListTile(
            title: Text(
              '${entry.conversionType == ConversionType.celsiusToFahrenheit ? "°C to F" : "F to °C"}: ${entry.value} = ${entry.result.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
