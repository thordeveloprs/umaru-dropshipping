import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_bar2_model.dart';
export 'app_bar2_model.dart';

class AppBar2Widget extends StatefulWidget {
  const AppBar2Widget({
    Key? key,
    this.appTitle,
  }) : super(key: key);

  final String? appTitle;

  @override
  _AppBar2WidgetState createState() => _AppBar2WidgetState();
}

class _AppBar2WidgetState extends State<AppBar2Widget> {
  late AppBar2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBar2Model());
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
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () async {
              context.pop();
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFC7C7CC),
                  size: 24,
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
        Expanded(
          flex: 2,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.appTitle!,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF1C86C2),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
        ),
      ],
    );
  }
}
