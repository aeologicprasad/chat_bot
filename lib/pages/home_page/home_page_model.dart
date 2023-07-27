import '/backend/api_requests/api_calls.dart';
import '/components/saved_chat_sheet_widget.dart';
import '/components/welcome/welcome_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (invokeChatGPT)] action in IconButton widget.
  ApiCallResponse? apiResultrfk;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    listViewController1?.dispose();
    textController?.dispose();
    listViewController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
