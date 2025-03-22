import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Function Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              'Click${clickCounter > 1 ? 's' : ''}',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              clickCounter=0;
              setState(() {});
            },
            child: Icon(Icons.refresh_outlined),
          ),
          
          const SizedBox(height: 10),

          FloatingActionButton(
            shape: const StadiumBorder(),
            onPressed: () {
              clickCounter++;
              setState(() {});
            },
            child: Icon(Icons.plus_one),
          ),
          
          const SizedBox(height: 10),

          FloatingActionButton(
            shape: const StadiumBorder(),
            onPressed: () {
              clickCounter--;
              setState(() {});
            },
            child: Icon(Icons.exposure_minus_1_outlined),
          ),
        ],
      ),
    );
  }
}
