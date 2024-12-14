import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayerScreen extends StatefulWidget {
  final int audiobookId;

  const PlayerScreen({required this.audiobookId, Key? key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isPlaying = false;
  bool _isBuffering = true;

  @override
  void initState() {
    super.initState();
    _setupAudio();
  }

  void _setupAudio() async {
    String url = 'https://example.com/audio_${widget.audiobookId}.mp3';

    try {
      await _audioPlayer.setSourceUrl(url);

      // Listen to audio duration
      _audioPlayer.onDurationChanged.listen((duration) {
        setState(() {
          _totalDuration = duration;
        });
      });

      // Listen to audio position
      _audioPlayer.onPositionChanged.listen((position) {
        setState(() {
          _currentPosition = position;
        });
      });

      // Handle buffering state
      _audioPlayer.onPlayerStateChanged.listen((state) {
        setState(() {
          _isBuffering = state == PlayerState.paused;
        });
      });

      // Handle playback completion
      _audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          _isPlaying = false;
          _currentPosition = Duration.zero;
        });
      });

      // Start playing
      await _audioPlayer.resume();
      setState(() {
        _isPlaying = true;
      });
    } catch (error) {
      // Handle any errors (e.g., network issues, invalid URL)
      print("Error setting up audio: $error");
    }
  }

  void _playPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _seekAudio(double value) async {
    final position = Duration(seconds: value.toInt());
    await _audioPlayer.seek(position);
    setState(() {
      _currentPosition = position;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Audiobook ${widget.audiobookId}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            _isBuffering
                ? CircularProgressIndicator()
                : Slider(
                    value: _currentPosition.inSeconds.toDouble(),
                    max: _totalDuration.inSeconds.toDouble(),
                    onChanged: _seekAudio,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey.shade300,
                  ),
            // Current time and total duration
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(_currentPosition),
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  _formatDuration(_totalDuration),
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Playback controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.fast_rewind, size: 36),
                  onPressed: () async {
                    final newPosition = _currentPosition - Duration(seconds: 10);
                    await _audioPlayer.seek(
                        newPosition > Duration.zero ? newPosition : Duration.zero);
                  },
                ),
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 36,
                  ),
                  onPressed: _playPause,
                ),
                IconButton(
                  icon: Icon(Icons.fast_forward, size: 36),
                  onPressed: () async {
                    final newPosition = _currentPosition + Duration(seconds: 10);
                    if (newPosition < _totalDuration) {
                      await _audioPlayer.seek(newPosition);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
