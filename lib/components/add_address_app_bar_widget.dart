import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddAddressAppBarWidget extends StatefulWidget {
  const AddAddressAppBarWidget({
    Key? key,
    this.appTitle,
  }) : super(key: key);

  final String? appTitle;

  @override
  _AddAddressAppBarWidgetState createState() => _AddAddressAppBarWidgetState();
}

class _AddAddressAppBarWidgetState extends State<AddAddressAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () async {
            context.pop();
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(9, 0, 5, 0),
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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.appTitle!,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF1C86C2),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15.64, 0),
              child: InkWell(
                onTap: () async {
                  context.pushNamed('add_Address_Page');
                },
                child: Image.asset(
                  'assets/images/Plus.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
