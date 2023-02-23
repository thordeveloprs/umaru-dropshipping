import '../backend/api_requests/api_calls.dart';
import '../components/app_bar2_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAddressModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for appBar_2 component.
  late AppBar2Model appBar2Model;
  // State field(s) for Fname widget.
  TextEditingController? fnameController;
  String? Function(BuildContext, String?)? fnameControllerValidator;
  // State field(s) for Lname widget.
  TextEditingController? lnameController;
  String? Function(BuildContext, String?)? lnameControllerValidator;
  // State field(s) for mobilefield widget.
  TextEditingController? mobilefieldController;
  String? Function(BuildContext, String?)? mobilefieldControllerValidator;
  // State field(s) for countryDropDown widget.
  String? countryDropDownValue;
  // State field(s) for streetaddress widget.
  TextEditingController? streetaddressController;
  String? Function(BuildContext, String?)? streetaddressControllerValidator;
  // State field(s) for buildApttextf widget.
  TextEditingController? buildApttextfController;
  String? Function(BuildContext, String?)? buildApttextfControllerValidator;
  // State field(s) for cityField widget.
  TextEditingController? cityFieldController;
  String? Function(BuildContext, String?)? cityFieldControllerValidator;
  // State field(s) for stateregionField widget.
  TextEditingController? stateregionFieldController;
  String? Function(BuildContext, String?)? stateregionFieldControllerValidator;
  // State field(s) for zippostalField widget.
  TextEditingController? zippostalFieldController;
  String? Function(BuildContext, String?)? zippostalFieldControllerValidator;
  // Stores action output result for [Backend Call - API (Edit Address API)] action in Button widget.
  ApiCallResponse? editaddressResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBar2Model = createModel(context, () => AppBar2Model());
  }

  void dispose() {
    appBar2Model.dispose();
    fnameController?.dispose();
    lnameController?.dispose();
    mobilefieldController?.dispose();
    streetaddressController?.dispose();
    buildApttextfController?.dispose();
    cityFieldController?.dispose();
    stateregionFieldController?.dispose();
    zippostalFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
