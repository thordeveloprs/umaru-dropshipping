import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'backbar_model.dart';
export 'backbar_model.dart';

class BackbarWidget extends StatefulWidget {
  const BackbarWidget({Key? key}) : super(key: key);

  @override
  _BackbarWidgetState createState() => _BackbarWidgetState();
}

class _BackbarWidgetState extends State<BackbarWidget> {
  late BackbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackbarModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(9, 0, 0, 0),
          child: InkWell(
            onTap: () async {
              context.pop();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFC7C7CC),
                    size: 24,
                  ),
                ),
                Text(
                  'Back',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFC7C7CC),
                        fontSize: 17,
                        letterSpacing: 0.41,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
