import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'cam_aws_model.dart';
export 'cam_aws_model.dart';

class CamAwsWidget extends StatefulWidget {
  const CamAwsWidget({
    super.key,
    this.example,
  });

  final String? example;

  static String routeName = 'CamAws';
  static String routePath = '/camAws';

  @override
  State<CamAwsWidget> createState() => _CamAwsWidgetState();
}

class _CamAwsWidgetState extends State<CamAwsWidget> {
  late CamAwsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CamAwsModel());
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.CameraAwesomeWidget(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
