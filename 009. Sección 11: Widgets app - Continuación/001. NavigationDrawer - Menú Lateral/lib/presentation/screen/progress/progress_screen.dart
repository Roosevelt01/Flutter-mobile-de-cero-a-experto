import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicators'),
      ),
      body: const _ProgressView(),   
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: const [
            SizedBox(width: 30),
            Text('Circular progress indicator'),
            SizedBox(height: 10),
            CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45),
            SizedBox(height: 20),
            Text('Circular indicator controlado'),_ControlledProgressIndicator()
          ],
        )
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2)/100;
      }).takeWhile((value) => value <=100),
      builder: (context, snapshot){
        final  progresssValue = snapshot.data ?? 0;
      
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
            CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Colors.black45,
              value:  progresssValue,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: LinearProgressIndicator(value: progresssValue),
            )
          ]
        ),
      );
    }
    );
  }
}