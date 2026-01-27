import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ramadan_apps/core/get_state/get_state.dart';

class GetStateBuilder<T extends GetxController> extends GetBuilder<T> {
  GetStateBuilder({
    super.key,
    super.init,
    isGlobal = false,
    required GetState container,
    required BuildContext context,
    required super.builder,
  }) : super(
         global: isGlobal,
         dispose: container.onDispose,
         initState: (GetBuilderState<T> controller) {
           container.registerStateEffect(context);
           WidgetsBinding.instance.endOfFrame.then(
             (_) => container.onReady(controller),
           );
         },
         didChangeDependencies: container.onDidChangeDependencies,
         didUpdateWidget: container.onDidUpdateWdiget,
       );
}
