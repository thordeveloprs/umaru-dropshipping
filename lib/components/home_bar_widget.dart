import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_bar_model.dart';
export 'home_bar_model.dart';

class HomeBarWidget extends StatefulWidget {
  const HomeBarWidget({Key? key}) : super(key: key);

  @override
  _HomeBarWidgetState createState() => _HomeBarWidgetState();
}

class _HomeBarWidgetState extends State<HomeBarWidget> {
  late HomeBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/Vector.png',
                width: 20.3,
                height: 21,
                fit: BoxFit.contain,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/Umaru_Logo_Image.png',
                width: 134,
                height: 67,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                onTap: () async {
                  context.pushNamed('Cart_Page');
                },
                child: Image.asset(
                  'assets/images/bag_(2)_1.png',
                  width: 17.4,
                  height: 23.7,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
