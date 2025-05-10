import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'preview_page_model.dart';
export 'preview_page_model.dart';

class PreviewPageWidget extends StatefulWidget {
  const PreviewPageWidget({
    super.key,
    this.type,
    this.imagePath,
    this.videoPath,
  });

  final String? type;
  final String? imagePath;
  final String? videoPath;

  static String routeName = 'PreviewPage';
  static String routePath = '/previewPage';

  @override
  State<PreviewPageWidget> createState() => _PreviewPageWidgetState();
}

class _PreviewPageWidgetState extends State<PreviewPageWidget> {
  late PreviewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreviewPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget.type == 'image')
                FlutterFlowMediaDisplay(
                  path: widget.imagePath!,
                  imageBuilder: (path) => ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      path,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                    path: path,
                    width: 300.0,
                    autoPlay: false,
                    looping: false,
                    showControls: false,
                    allowFullScreen: false,
                    allowPlaybackSpeedMenu: false,
                    pauseOnNavigate: false,
                  ),
                ),
              if (widget.type == 'video')
                FlutterFlowMediaDisplay(
                  path: widget.videoPath!,
                  imageBuilder: (path) => ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      path,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                    path: path,
                    width: 300.0,
                    autoPlay: true,
                    looping: true,
                    showControls: false,
                    allowFullScreen: false,
                    allowPlaybackSpeedMenu: false,
                    pauseOnNavigate: false,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
