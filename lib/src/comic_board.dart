import 'dart:math';
import 'package:flutter/material.dart';

/// # Define Activity Status number
///
/// - 0 -> none
/// - 1 -> lwo
/// - 2 -> medium
/// - 3 -> high
enum ActivityStatus { none, low, medium, high }

/// # Make `activityMatrixMaker` function more
List<List<ActivityStatus>> getActivities({required List<List<int>> eagData}) {
  // This is number is only for color bumping in graph
  const int none = 0, low = 1, medium = 2, high = 3;

  // Return understandable data of (0, 3) to show it in Flutter widget
  return eagData
      .map((row) => row.map((columnNumber) {
            ActivityStatus state = ActivityStatus.none;
            switch (columnNumber) {
              case none:
                state = ActivityStatus.none;
                break;
              case low:
                state = ActivityStatus.low;
                break;
              case medium:
                state = ActivityStatus.medium;
                break;
              case high:
                state = ActivityStatus.high;
                break;
            }
            return state;
          }).toList())
      .toList();
}

Color noneActivityContainerColor = Colors.blue.shade100;
Color lowActivityContainerColor = Colors.blue.shade300;
Color mediumActivityContainerColor = Colors.blue.shade600;
Color highActivityContainerColor = Colors.blue.shade900;

const double containerMarginPerAllSide = 2.0;
const double containerWSizeEAG = 15.0;
const double containerHSizeEAG = 15.0;
const double containerRadiusSizeEAG = 2.0;
// Shadow of the containers as day
Color squireContainerShadowColor = Colors.black.withOpacity(0.1);
const double containerBlurRadiusSize = 2.0;
const double containerSpreadRadiusSize = 1.0;
const double finalEAGContainerMargin = 10.0;
const double colorRangeVConstraint = 10.0;
// Constraint of Legend text in `EAG`
const double legendHSpace = 2.0;

/// # MakeDay in Container mode
///
/// Create custom Container Flutter widget and specific Color of that by
/// `genColor` map to show `none`, `low`, `medium` and `high` Exercise activity
/// of the users.
///
/// - status‌: [ActivityStatus] -> (none, low, medium, high)
Widget makeDay(ActivityStatus status, BuildContext context) {
  // Init AppLocalization
  // AppLocalizations t = AppLocalizations.of(context);

  // Specific color of container by activity status indicator
  Map<ActivityStatus, Color> genColor = {
    ActivityStatus.none: noneActivityContainerColor,
    ActivityStatus.low: lowActivityContainerColor,
    ActivityStatus.medium: mediumActivityContainerColor,
    ActivityStatus.high: highActivityContainerColor,
  };

  /// # Make a squire Container to show activities by color bumping
  ///
  /// _Note:_ all configs came from `resources.dart` and `colors.dart`.
  return Tooltip(
    message: status.name,
    child: Container(
      margin: const EdgeInsets.all(containerMarginPerAllSide),
      width: containerWSizeEAG,
      height: containerHSizeEAG,
      decoration: BoxDecoration(
        color: genColor[status],
        borderRadius: BorderRadius.circular(containerRadiusSizeEAG),
        boxShadow: [
          BoxShadow(
            color: squireContainerShadowColor,
            blurRadius: containerBlurRadiusSize,
            spreadRadius: containerSpreadRadiusSize,
            offset: const Offset(0.0, 1.0),
          ),
        ],
      ),
    ),
  );
}

class ComicBoard extends StatelessWidget {
  /// # Exercise Activity Graph (EAG)
  ///
  /// Main idea came from the GitHub code activity in a year, and show it in
  /// case of 48~50x7 matrix. ~50 cols would be weeks and 7 rows would be days.
  ///
  /// #‌#‌ Properties - eagData: [required List<List<int>>] -> Passing activity
  /// data like mode.  _Note:_ Read more about the scheme of the matrix in
  /// `sample_data_eag.dart`
  /// ##‌ EXAMPLE
  ///
  /// ComicBoard(
  ///   eagData,
  /// ),
  ///
  /// ##‌ eagData would prepare by following procedure:
  ///
  ///  - Init `EAG` data from the `sample_data_eag.dart`.
  ///  - After init `EAG` need a place to save data of current user
  /// in local or server base DB. Getting data by a simple matrix, child of
  /// matrix is 0...4.
  ///
  ///  - default matrix cols and rows value must be 57x7, 7 for days of a week.
  ///  - We can have some buttons to change years of user activity
  /// in case of `EAG`. (overkill //TODO:‌ for some case, because can be not
  /// important but that will check by team)
  const ComicBoard({
    Key? key,
    required this.eagData,
  }) : super(key: key);

  final List<List<int>> eagData;

  @override
  Widget build(BuildContext context) {
    // AppLocalizations t = AppLocalizations.of(context);

    /// # Getting days as matrix of number
    ///
    /// Its look like this data:
    /// [
    ///   [ActivityStatus.hight, ActivityStatus.none, ...],
    ///   [ActivityStatus.low, ActivityStatus.medium, ...],
    ///   ...
    /// ]
    final List<List<ActivityStatus>> days = getActivities(eagData: eagData);

    List<Widget> makeCol(List<ActivityStatus> day) {
      return day.map((status) => makeDay(status, context)).toList();
    }

    // Make row of the EAG by putting column in children of the row
    final rows = days
        .map(
          (colActivity) => Row(
            mainAxisSize: MainAxisSize.min,
            children: makeCol(colActivity),
          ),
        )
        .toList();

    List<Color> activityColorRange = [
      noneActivityContainerColor,
      lowActivityContainerColor,
      mediumActivityContainerColor,
      highActivityContainerColor,
    ];

    final colorRange = activityColorRange
        .map(
          (range) => Container(
            margin: const EdgeInsets.all(containerMarginPerAllSide),
            width: containerWSizeEAG,
            height: containerHSizeEAG,
            decoration: BoxDecoration(
              color: range,
              borderRadius: BorderRadius.circular(containerRadiusSizeEAG),
            ),
          ),
        )
        .toList();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: finalEAGContainerMargin,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: rows,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: colorRangeVConstraint,
            horizontal: finalEAGContainerMargin,
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   t.translate("eag.less"),
              //   style: Styles.themeData(
              //     context,
              //   ).textTheme.caption,
              // ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: legendHSpace),
              ),
              Row(children: colorRange),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: legendHSpace),
              ),
              // Text(
              //   t.translate("eag.more"),
              //   style: Styles.themeData(
              //     context,
              //   ).textTheme.caption,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

/// # Make matrix of activity function (PROMOTION)
///
/// This is only test function to getting matrix of activity.  Data would like
/// this data:
///
/// ## EXAMPLE
///
/// _Note:_ This is only sample data. Data of columns or rows may be more than
/// (13, 7), it not important we will have data from any where, Any data in
/// cells should be in range of 0, 3 number.
///
/// ```dart
/// List<List<int>> activityRawData = [
///   [0, 0, 3, 1, 2, 0, 3, 1, 2, 2, 2, 0, 2],
///   [2, 1, 1, 2, 2, 3, 0, 2, 2, 3, 1, 2, 3],
///   [1, 1, 3, 1, 2, 1, 3, 1, 2, 2, 3, 0, 1],
///   [1, 1, 3, 2, 2, 0, 0, 0, 2, 1, 3, 0, 3],
///   [2, 1, 3, 3, 2, 0, 0, 2, 0, 0, 2, 1, 1],
///   [2, 1, 1, 1, 3, 2, 1, 3, 0, 3, 0, 2, 0],
///   [0, 3, 2, 3, 0, 0, 1, 1, 3, 3, 1, 0, 0]
/// ];
///
/// ```
/// - cols: [int] -> Columns of Graph
/// - raws: [int] -> Rows of Graph
List<List<int>> activityMatrixMaker(int cols, int rows) {
  // Init values of matrix
  List<List<int>> rawData = [];

  // Generate new random value for cells
  for (int i = 0; i < rows; i++) {
    List<int> list = [];
    for (int j = 0; j < cols; j++) {
      // Make Random value
      list.add(Random().nextInt(4));
    }
    rawData.add(list);
  }

  return rawData;
}

/// #‌ Initiate data of eag
///
/// Init data in `EAG` would be `0`.
/// Only use this functionality when you want create new eag for users activity.
/// Any change can effect to be useless.
List<List<int>> initEAG({required int rows, required int column}) =>
    List.filled(rows, List.filled(column, 0));
