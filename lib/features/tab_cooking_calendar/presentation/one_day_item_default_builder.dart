import 'package:flutter/material.dart';

/// `TableCalendar` の `defaultBuilder` として使うクロージャ
///
/// 引数で日付セルの高さを渡すため、ステート側で `_dayCellHeight` を渡して使用すること
Widget Function(BuildContext, DateTime, DateTime) oneDayItemDefaultBuilder(
  double dayCellHeight,
) {
  return (context, day, focusedDay) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green[600]!, width: 0.5),
      ),
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: dayCellHeight, // セル高さ（変更可）
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              day.day.toString(),
              style: const TextStyle(color: Colors.black87),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  };
}
