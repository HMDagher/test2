// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CameraAwesomeWidget extends StatefulWidget {
  const CameraAwesomeWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CameraAwesomeWidget> createState() => _CameraAwesomeWidgetState();
}

class _CameraAwesomeWidgetState extends State<CameraAwesomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photoAndVideo(
          photoPathBuilder: (sensors) async {
            final Directory extDir = await getTemporaryDirectory();
            final testDir = await Directory('${extDir.path}/camerawesome')
                .create(recursive: true);
            final String filePath =
                '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
            return SingleCaptureRequest(filePath, sensors.first);
          },
          videoPathBuilder: (sensors) async {
            final Directory extDir = await getTemporaryDirectory();
            final testDir = await Directory('${extDir.path}/camerawesome')
                .create(recursive: true);
            final String filePath =
                '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';
            return SingleCaptureRequest(filePath, sensors.first);
          },
        ),
        sensorConfig: SensorConfig.single(
          aspectRatio: CameraAspectRatios.ratio_4_3,
          flashMode: FlashMode.auto,
          sensor: Sensor.position(SensorPosition.back),
        ),
        onMediaTap: (mediaCapture) {
          print('Tap on ${mediaCapture.captureRequest.path}');
        },
        bottomActionsBuilder: (state) {
          return AwesomeBottomActions(
            state: state,
            // Add any custom actions here
          );
        },
        topActionsBuilder: (state) {
          return AwesomeTopActions(
            state: state,
            // Add any custom actions here
          );
        },
        middleContentBuilder: (state) {
          return Column(
            children: [
              const Spacer(),
              AwesomeCameraModeSelector(state: state),
            ],
          );
        },
        progressIndicator: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
