import 'package:ecommerce/status_change/component/connect_indicator.dart';
import 'package:ecommerce/status_change/component/indicators.dart';
import 'package:ecommerce/status_change/component/status_change_tile_builder.dart';
import 'package:ecommerce/status_change/status_view.dart';
import 'package:ecommerce/status_change/theme/connect_indicator_theme.dart';
import 'package:ecommerce/status_change/theme/status_change_theme.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

class StatusStepper extends StatelessWidget {
  final int processIndex;
  final List<String> stepTitle;
  final List<String> stepSubTitle;
  final List<String> stepDescription;
  final Axis direction;
  const StatusStepper({
    Key? key,
    required this.processIndex,
    required this.stepTitle,
    this.stepSubTitle = const [''],
    this.stepDescription = const [''],
    this.direction = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const inProgressColor = Colors.black87;
    const todoColor = Color(0xffd1d2d7);

    Color getColor(int index) {
      if (index == processIndex) {
        return inProgressColor;
      } else if (index < processIndex) {
        return kPrimaryColor;
      } else {
        return todoColor;
      }
    }

    return StatusChange.tileBuilder(
      theme: StatusChangeThemeData(
        direction: direction,
        connectorTheme: const ConnectorThemeData(space: 1.0, thickness: 1.0),
      ),
      builder: StatusChangeTileBuilder.connected(
        itemWidth: (_) => stepDescription[0] == ''
            ? 0
            : MediaQuery.of(context).size.width / stepTitle.length,
        contentWidgetBuilder: (context, index) {
          return Visibility(
            visible: stepDescription[0] != '',
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                stepDescription[index],
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          );
        },
        nameWidgetBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stepTitle[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getColor(index),
                  ),
                ),
                Visibility(
                  visible: stepSubTitle[0] != '',
                  child: Text(
                    stepSubTitle[index],
                    style: TextStyle(
                      color: getColor(index),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        indicatorWidgetBuilder: (_, index) {
          if (index <= processIndex) {
            return DotIndicator(
              size: 35.0,
              border: Border.all(color: kPrimaryColor, width: 1),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            );
          } else {
            return const OutlinedDotIndicator(
              size: 30,
              borderWidth: 1.0,
              color: todoColor,
            );
          }
        },
        lineWidgetBuilder: (index) {
          if (index > 0) {
            if (index == processIndex) {
              final prevColor = getColor(index - 1);
              final color = getColor(index);
              List<Color> gradientColors;
              gradientColors = [prevColor, Color.lerp(prevColor, color, 0.5)!];
              return DecoratedLineConnector(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                  ),
                ),
              );
            } else {
              return SolidLineConnector(
                color: getColor(index),
              );
            }
          } else {
            return null;
          }
        },
        itemCount: stepTitle.length,
      ),
    );
  }
}
