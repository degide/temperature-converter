import 'package:flutter/material.dart';

import '../enums/converter_enums.dart';
import '../models/converter_models.dart';

class ConversionHistory extends StatelessWidget {
  const ConversionHistory({
    super.key,
    required this.history,
    required this.clearHistory
  });

  final List<TemperatureConversion> history;
  final void Function() clearHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // boxShadow: List.of([
        //   BoxShadow(
        //     color: const Color.fromARGB(255, 205, 205, 205), 
        //     spreadRadius: 3, 
        //     blurRadius: 4,
        //   )
        // ]),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 238, 238, 238),
        border: Border.all(color: const Color.fromARGB(255, 223, 223, 223), width: 1.5),
      ),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 5),
            child: Wrap(
              spacing: 10,
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.history, color: const Color.fromARGB(255, 70, 81, 90)),
                Text(
                  "Conversion History", 
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 70, 81, 90),
                  ),
                )
              ],
            ),
          ),
          history.isNotEmpty ? Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final entry = history[index];
                return ListTile(
                  leading: Icon(Icons.thermostat, color: Colors.grey),
                  title: Text(
                    '${entry.conversionType == ConversionType.celsiusToFahrenheit ? "°C to F" : "F to °C"}: ${entry.value} = ${entry.result.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ) : const Expanded(
            child: Center(
              child: Text('No history found'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: clearHistory,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 0.5,
                        backgroundColor: Colors.red,
                      ),
                      icon: Icon(Icons.clear, color: Colors.white,),
                      label: const Text('Clear history', style: TextStyle(color: Colors.white),),
                    ),
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
