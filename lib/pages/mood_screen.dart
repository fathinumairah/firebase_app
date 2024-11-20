// mood_screen.dart
import 'package:flutter/material.dart';
import 'mood_bothered.dart';

class MoodScreen extends StatelessWidget {
  final String selectedMood;

  const MoodScreen({
    required this.selectedMood,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> moods = [
      {
        'title': 'Happiness',
        'description': 'Feeling joy, contentment, and positive vibes.',
        'imagePath': 'assets/images/happiness.png',
        'relatedMood': 'home1',
      },
      {
        'title': 'Disgust',
        'description': 'Intense dislike or revulsion toward something.',
        'imagePath': 'assets/images/disgust.png',
        'relatedMood': 'home2',
      },
      {
        'title': 'Sadness',
        'description': 'Deep sorrow or emotional pain.',
        'imagePath': 'assets/images/sadness.png',
        'relatedMood': 'home3',
      },
      {
        'title': 'Surprise',
        'description': 'A sudden, unexpected reaction to something.',
        'imagePath': 'assets/images/surprise.png',
        'relatedMood': 'home4',
      },
      {
        'title': 'Exhaustion',
        'description': 'Extreme tiredness, mentally or physically drained.',
        'imagePath': 'assets/images/exhaustion.png',
        'relatedMood': 'home5',
      },
      {
        'title': 'Apprehension',
        'description': 'Nervous anticipation of something uncertain.',
        'imagePath': 'assets/images/apprehension.png',
        'relatedMood': 'home6',
      },
      {
        'title': 'Anger',
        'description': 'Strong feeling of frustration or rage.',
        'imagePath': 'assets/images/anger.png',
        'relatedMood': 'home7',
      },
      {
        'title': 'Fear',
        'description': 'Worry or anxiety about danger or the unknown.',
        'imagePath': 'assets/images/fear.png',
        'relatedMood': 'home8',
      },
    ];

    final selectedMoodData = moods.firstWhere(
      (mood) => mood['relatedMood'] == selectedMood,
      orElse: () => moods[0],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFD3B7B7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Know Your Mood',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            // Selected Mood Card at the top
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.black87, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          selectedMoodData['imagePath'],
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  selectedMoodData['title'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  '(Selected)',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              selectedMoodData['description'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Other Moods List
            Expanded(
              child: ListView.builder(
                itemCount: moods.length,
                itemBuilder: (context, index) {
                  final mood = moods[index];
                  // Skip the selected mood as it's already shown at the top
                  if (mood['relatedMood'] == selectedMood) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF0F0F0),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset(
                                  mood['imagePath'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mood['title'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      mood['description'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Next Button
            Container(
              width: 120,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MoodBotheredScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}