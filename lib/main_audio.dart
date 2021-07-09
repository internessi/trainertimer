import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'trainer/trainer_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trainer Timer',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Trainer Timer (progress 06.29)'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Text('Standard Timer'),
            ),
            const Gap(30),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Special Timer'),
            ),
            const Gap(30),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<TrainerPage>(
                  builder: (context) => const TrainerPage(),
                ),
              ),
              child: const Text('Trainer Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
