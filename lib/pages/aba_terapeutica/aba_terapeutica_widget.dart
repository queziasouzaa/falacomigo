import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'aba_terapeutica_model.dart';
export 'aba_terapeutica_model.dart';

/// página com ensinamentos ludicos, onde com a ajuda de um T.O.
///
/// a criança pode desenvolver a habilidade de se comunicar utilizando os
/// botões.
class AbaTerapeuticaWidget extends StatefulWidget {
  const AbaTerapeuticaWidget({super.key});

  static String routeName = 'AbaTerapeutica';
  static String routePath = 'abaTerapeutica';

  @override
  State<AbaTerapeuticaWidget> createState() => _AbaTerapeuticaWidgetState();
}

class _AbaTerapeuticaWidgetState extends State<AbaTerapeuticaWidget> {
  late AbaTerapeuticaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AbaTerapeuticaModel());
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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(HomePageWidget.routeName);
              },
              child: Container(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '6yja1qbi' /* Esta aba não está pronta ainda... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Kid',
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
