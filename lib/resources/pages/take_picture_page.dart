import 'dart:io';
import 'dart:math';

//import 'package:better_open_file/better_open_file.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:path_provider/path_provider.dart';

class TakePicturePage extends NyStatefulWidget {

  static RouteView path = ("/take-picture", (_) => TakePicturePage());
  
  TakePicturePage({super.key}) : super(child: () => _TakePicturePageState());
}

class _TakePicturePageState extends NyPage<TakePicturePage> {

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take Wound Picture")
      ),
      body: SafeArea(
        child: CameraAwesomeBuilder.custom(
        builder: (cameraState, preview) {
          return Stack(
            children: [
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: Text(
                      "Tap to take a photo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 100,
                    child: StreamBuilder<MediaCapture?>(
                      stream: cameraState.captureState$,
                      builder: (_, snapshot) {
                        if (snapshot.data == null) {
                          return const SizedBox.shrink();
                        }
                        return AwesomeMediaPreview(
                          mediaCapture: snapshot.data!,
                          onMediaTap: (MediaCapture mediaCapture) {
                            // ignore: avoid_print
                            print("Tap on $mediaCapture");
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        saveConfig: SaveConfig.photo(),
        onPreviewTapBuilder: (state) => OnPreviewTap(
          onTap: (Offset position, PreviewSize flutterPreviewSize,
              PreviewSize pixelPreviewSize) {
            state.when(onPhotoMode: (picState) => picState.takePhoto());
          },
          onTapPainter: (tapPosition) => TweenAnimationBuilder(
            key: ValueKey(tapPosition),
            tween: Tween<double>(begin: 1.0, end: 0.0),
            duration: const Duration(milliseconds: 500),
            builder: (context, anim, child) {
              return Transform.rotate(
                angle: anim * 2 * pi,
                child: Transform.scale(
                  scale: 4 * anim,
                  child: child,
                ),
              );
            },
            child: const Icon(
              Icons.camera,
              color: Colors.white,
            ),
          ),
        ),
      ),

        // child: CameraAwesomeBuilder.awesome(
        //   availableFilters: [],
        //   sensorConfig: SensorConfig.single(
        //     zoom: 0.0,
        //   ),
        //   saveConfig: SaveConfig.photo(
        //     pathBuilder: (sensors) async {
        //       final Directory extDir = await getTemporaryDirectory();
        //       final testDir = await Directory(
        //         '${extDir.path}/camerawesome',
        //       ).create(recursive: true);
        //       if (sensors.length == 1) {
        //         final String filePath =
        //             '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
        //         return SingleCaptureRequest(filePath, sensors.first);
        //       }
        //       // Separate pictures taken with front and back camera
        //       return MultipleCaptureRequest(
        //         {
        //           for (final sensor in sensors)
        //             sensor:
        //                 '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
        //         },
        //       );
        //     },
        //   ),
        //   onMediaTap: (mediaCapture) {
        //     mediaCapture.captureRequest.when(
        //       single: (single) {
        //         debugPrint('single: ${single.file?.path}');
        //         single.file?.openRead();
        //       },
        //       multiple: (multiple) {
        //         multiple.fileBySensor.forEach((key, value) {
        //           debugPrint('multiple file taken: $key ${value?.path}');
        //           value?.openRead();
        //         });
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}

// extension XfileOpen on XFile {
//   Future<void> open() async {
//     await open();
//     //await OpenFile.open(path);
//   }
// }