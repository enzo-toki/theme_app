// lib/widgets/theme_card.dart
import 'package:flutter/material.dart';
import '../models/theme_model.dart';

class ThemeCard extends StatelessWidget {
  final ThemeModel theme;
  final VoidCallback onApply;
  final VoidCallback onPlayRingtone;
  final VoidCallback onPlayNotification;

  const ThemeCard({
    super.key,
    required this.theme,
    required this.onApply,
    required this.onPlayRingtone,
    required this.onPlayNotification,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(theme.name, style: Theme.of(context).textTheme.titleLarge),
          Image.asset(theme.previewImageHome, height: 180, fit: BoxFit.cover),
          Image.asset(theme.previewImageLock, height: 180, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow),
                label: const Text('Suoneria'),
                onPressed: onPlayRingtone,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.notifications),
                label: const Text('Notifica'),
                onPressed: onPlayNotification,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('Applica'),
                onPressed: onApply,
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
