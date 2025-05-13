// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/theme_model.dart';
import '../widgets/theme_card.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<ThemeModel> themes = [
    ThemeModel(
      name: 'Tramonto',
      previewImageHome: 'assets/images/sunset_home.jpg',
      previewImageLock: 'assets/images/sunset_lock.jpg',
      ringtonePath: 'assets/audio/sunset_ringtone.mp3',
      notificationPath: 'assets/audio/sunset_notification.mp3',
    ),
    // Qui potrai aggiungere altri temi
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(String path) {
    _audioPlayer.stop();
    _audioPlayer.play(AssetSource(path.replaceFirst('assets/', '')));
  }

  void _applyTheme(BuildContext context, ThemeModel theme) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tema "${theme.name}" applicato (simulato)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: themes.length,
      itemBuilder: (context, index) {
        final theme = themes[index];
        return ThemeCard(
          theme: theme,
          onApply: () => _applyTheme(context, theme),
          onPlayRingtone: () => _playAudio(theme.ringtonePath),
          onPlayNotification: () => _playAudio(theme.notificationPath),
        );
      },
    );
  }
}
