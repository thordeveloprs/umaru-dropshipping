import '../components/app_bar2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShippingPageWidget extends StatefulWidget {
  const ShippingPageWidget({Key? key}) : super(key: key);

  @override
  _ShippingPageWidgetState createState() => _ShippingPageWidgetState();
}

class _ShippingPageWidgetState extends State<ShippingPageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AppBar2Widget(
                  appTitle: 'Shipping Policy',
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Title',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse rhoncus orci eu nunc blandit, sollicitudin vehicula lorem varius. In hac habitasse platea dictumst. Curabitur consectetur viverra mauris, vitae sollicitudin sapien fringilla non. Praesent venenatis imperdiet augue. Etiam sed purus et mi egestas tristique at ut elit. Aliquam erat volutpat. Duis sapien arcu, dapibus ut volutpat finibus, porta et est. In hac habitasse platea dictumst. Maecenas eleifend magna dolor, eu aliquam nisl commodo semper.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse rhoncus orci eu nunc blandit, sollicitudin vehicula lorem varius. In hac habitasse platea dictumst. Curabitur consectetur viverra mauris, vitae sollicitudin sapien fringilla non. Praesent venenatis imperdiet augue. Etiam sed purus et mi egestas tristique at ut elit. Aliquam erat volutpat. Duis sapien arcu, dapibus ut volutpat finibus, porta et est. In hac habitasse platea dictumst. Maecenas eleifend magna dolor, eu aliquam nisl commodo semper.\n\n',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF9098B1),
                                    fontSize: 12,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
