import 'package:sdui_demo/details_screen.dart';
import 'package:sdui_demo/models/arguments_model.dart';
import 'package:sdui_demo/models/section_model.dart';
import 'package:sdui_demo/tile_button_view.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'models/action_model.dart';

class WidgetMapper {
  WidgetMapper._();

  static WidgetMapper get i => WidgetMapper._();

  /// getting widgets by checking UI TYPE inside language model
  static Future<Widget> getWidget({
    BuildContext? context,
    required SectionsModel languageModel,
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
              onTap: () => onTap(model),
            ),
          );
          break;

        default:
          const Text('Error widget');
      }
    }

    return buttonWidget;
  }

  void onTap(
    ActionModel actionModel, {
    BuildContext? context,
    dynamic arguments,
  }) {
    debugPrint('-------Clicked-----');
    navigatorKey.currentState?.pushNamed(
      '/details',
      arguments: ArgumentsModel(
        title: actionModel.title ?? 'Akhtar',
        subTitle: actionModel.subtitle ?? 'Akhtar is a Flutter Developer',
        uiType: actionModel.uiType ?? 'Tile_Button',
      ),
    );
    //
    // Navigator.pushNamed(
    //   context!,
    //   DetailsScreen.routeName,
    //   arguments: ArgumentsModel(
    //       title: 'Akhtar',
    //       subTitle: 'Akhtar is a Flutter Developer',
    //       uiType: 'Tile_Button'),
    // );
  }
}
