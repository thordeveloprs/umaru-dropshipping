import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'count_controller_model.dart';
export 'count_controller_model.dart';

class CountControllerWidget extends StatefulWidget {
  const CountControllerWidget({Key? key}) : super(key: key);

  @override
  _CountControllerWidgetState createState() => _CountControllerWidgetState();
}

class _CountControllerWidgetState extends State<CountControllerWidget> {
  late CountControllerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountControllerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 104,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Color(0xFF1C86C2),
            width: 1,
          ),
        ),
        child: FlutterFlowCountController(
          decrementIconBuilder: (enabled) => FaIcon(
            FontAwesomeIcons.minus,
            color: enabled ? Color(0xFF5F5F5F) : Color(0xFFEEEEEE),
            size: 9.33,
          ),
          incrementIconBuilder: (enabled) => FaIcon(
            FontAwesomeIcons.plus,
            color: enabled ? Color(0xFF1C86C2) : Color(0xFFEEEEEE),
            size: 9.33,
          ),
          countBuilder: (count) => Text(
            count.toString(),
            style: GoogleFonts.getFont(
              'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          count: _model.countControllerValue ??= 0,
          updateCount: (count) async {
            setState(() => _model.countControllerValue = count);
            setState(() {
              FFAppState().count = _model.countControllerValue!;
            });
          },
          stepSize: 1,
        ),
      ),
    );
  }
}
