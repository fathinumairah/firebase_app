import 'package:flutter/material.dart';

class SleepTrackerScreen extends StatefulWidget {
  const SleepTrackerScreen({Key? key}) : super(key: key);

  @override
  _SleepTrackerScreenState createState() => _SleepTrackerScreenState();
}

class _SleepTrackerScreenState extends State<SleepTrackerScreen> {
  double _sliderValue = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3B7B7), 
      appBar: AppBar(
        title: const Text('Sleep Tracker'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'How would you rate your sleep quality?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Labels and emojis column
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SleepQualityLabel(label: 'Excellent\n7-9 hours', imagePath: 'assets/images/smile_green.png'),
                    SleepQualityLabel(label: 'Good\n6-7 hours', imagePath: 'assets/images/smile_light_green.png'),
                    SleepQualityLabel(label: 'Fair\n5 hours', imagePath: 'assets/images/neutral_yellow.png'),
                    SleepQualityLabel(label: 'Poor\n3-4 hours', imagePath: 'assets/images/sad_orange.png'),
                    SleepQualityLabel(label: 'Worst\n<3 hours', imagePath: 'assets/images/sad_red.png'),
                  ],
                ),
                const SizedBox(width: 20), // Add some space for better layout
                // Slider
                SizedBox(
                  height: 520, // Increase height of the slider area for longer line
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 4,
                      divisions: 4,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                      activeColor: Colors.brown,
                      inactiveColor: Colors.brown[200],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SleepQualityLabel extends StatelessWidget {
  final String label;
  final String imagePath;

  const SleepQualityLabel({required this.label, required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0), // Adjust padding if necessary
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 80, // Increased emoji size
            height: 80,
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
