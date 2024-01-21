import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:player/apiservice.dart';
import 'package:player/models/songinfo/song_info.dart';
import 'package:player/models/songresults/song_results.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage(title: 'test'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();
  double _calibratedAxis = 0;
  double _newTempoValue = 0;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  Duration sensorInterval = SensorInterval.onesec;
  AccelerometerEvent? _accelerometerEvent;

  DateTime? _accelerometerUpdateTime;
  // static const Duration _ignoreDuration = Duration(milliseconds: 20);

  List<Results>? songList;
  List<Object> songnames = ['asjbhasyh', ';asihiawsk'];
  String selectedSong = '';

  @override
  void initState() {
    super.initState();
    player.setReleaseMode(ReleaseMode.loop);
    _getData();
    _streamSubscriptions.add(
      accelerometerEventStream(samplingPeriod: sensorInterval).listen(
        (AccelerometerEvent event) {
          final now = DateTime.now();
          setState(() {
            _accelerometerEvent = event;
            _adjustTempo(event.y);
            if (_accelerometerUpdateTime != null) {
              // final interval = now.difference(_accelerometerUpdateTime!);
              // if (interval > _ignoreDuration) {
              //   _accelerometerLastInterval = interval.inMilliseconds;
              // }
            }
          });
          _accelerometerUpdateTime = now;
        },
        onError: (e) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("Sensor Not Found"),
                  content: Text(
                      "It seems that your device doesn't support Accelerometer Sensor"),
                );
              });
        },
        cancelOnError: true,
      ),
    );
  }

  Future<void> playAudioFromUrl(String url) async {
     await player.play(UrlSource(url));
  }

  void _getData() async {
    SongResults songs = (await ApiService().getSongs());
    setState(() {
      songList = songs.results;
    });
  }

  Future<void> pauseAudio() async {
    await player.pause();
  }

  Future<void> tempoChange(double playback) async {
    if (playback.isFinite) {
      await player.setPlaybackRate(playback);
    }
  }

  double lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }

  void _adjustTempo(double adjustment) {
    if (_calibratedAxis != 0) {
      double targetSpeed = (adjustment - _calibratedAxis).abs();

      // Ensure that the target speed remains within a reasonable range
      targetSpeed = targetSpeed.clamp(0.1, 2.0);

      // Define a smoothing factor (adjust as needed)
      double smoothingFactor = 0.2;
      int delayMilliseconds = 500;
      // Smoothly transition to the target speed
      double newSpeed =
          lerpDouble(player.playbackRate, targetSpeed, smoothingFactor);
      setState(() {
        _newTempoValue = newSpeed;
      });
      Future.delayed(Duration(milliseconds: delayMilliseconds), () {
            player.setPlaybackRate(newSpeed);
    });
    }
  }

  Future<void> calibrate(double axis) async {
    setState(() {
      _calibratedAxis = axis;
    });
  }

  Future<void> setSelectedSong(Results? value) async {
    SongInfo results = await ApiService().getSongInfo(value?.id??0);
    setState(() {
      selectedSong = results.previews?.previewHqMp3 ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Title'),
      ),
      body: Center(
          child: Column(
        children: [
          DropdownButton(
            isExpanded: true,
              items: songList
                  ?.map((e) => DropdownMenuItem(
                      child: new Text(e.name ?? ""), value: e))
                  .toList(),
              onChanged: (newValue) {
                setSelectedSong(newValue);
              }),
          ElevatedButton(
              onPressed: () {
                playAudioFromUrl(
                    selectedSong);
              },
              child: const Text('Play Audio')),
          ElevatedButton(
              onPressed: () {
                pauseAudio();
              },
              child: const Text('Pause')),
          ElevatedButton(
              onPressed: () {
                calibrate(_accelerometerEvent?.y ?? 0);
              },
              child: const Text('Calibrate')),
          Text(_accelerometerEvent?.y.toStringAsFixed(1) ?? '?'),
          Text(_calibratedAxis.toStringAsFixed(1)),
          Text(_newTempoValue.toStringAsFixed(1)),
        ],
      )),
    );
  }
}
