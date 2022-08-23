import 'package:sdui_demo/models/language_model.dart';
import 'package:sdui_demo/tile_button_view.dart';

import 'models/action_model.dart';
import 'package:flutter/material.dart';

class WidgetMapper {
  WidgetMapper._();

  static WidgetMapper get i => WidgetMapper._();

  /// getting widgets by checking UI TYPE inside language model
  static Future<Widget> getWidget({
    BuildContext? context,
    required LanguageModel languageModel,
    VoidCallback? onTap,
  }) async {
    switch (languageModel.uiType) {
      case 'tile_button':
        return languageModel.action == null
            ? const SizedBox()
            : Column(
                children: WidgetMapper.i.getButton(languageModel.action!),
              );

      default:
        return const SizedBox();
    }
  }

  /// created button list and returned specific type of button by using for loop on ActionModel
  List<Widget> getButton(List<ActionModel> actionList,
      {BuildContext? context}) {
    List<Widget> buttonWidget = [];

    for (ActionModel model in actionList) {
      switch (model.uiType) {
        case 'tile_button':
          buttonWidget.add(
            TileButtonView(
              title: model.title,
              prefixIcon: model.prefixIcon,
              suffixIcon: model.suffixIcon,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              onTap: () {
                //TODO:
              },
            ),
          );
          break;

        default:
          const Text('Error widget');
      }
    }

    return buttonWidget;
  }
}
