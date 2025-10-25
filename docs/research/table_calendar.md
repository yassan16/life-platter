# TableCalendar の CalendarBuilders 主要引数一覧

## ✅ CalendarBuilders の主要引数一覧
| 引数名                 | 型                                                        | 説明                                                                           |
| ---------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------------ |
| **defaultBuilder**     | `Widget? Function(BuildContext, DateTime, DateTime)`      | 通常の日付セル（選択・今日以外）を描画するカスタム関数。セル全体を置き換える。 |
| **todayBuilder**       | `Widget? Function(BuildContext, DateTime, DateTime)`      | 今日の日付セルを描画するカスタム関数。                                         |
| **selectedBuilder**    | `Widget? Function(BuildContext, DateTime, DateTime)`      | 選択された日付セルを描画するカスタム関数。                                     |
| **outsideBuilder**     | `Widget? Function(BuildContext, DateTime, DateTime)`      | 今月以外の日付（例：前後の月に属する日）を描画するカスタム関数。               |
| **markerBuilder**      | `Widget? Function(BuildContext, DateTime, List<dynamic>)` | イベント（予定・料理名など）を日付セルの中に追加描画するための関数。           |
| **dowBuilder**         | `Widget? Function(BuildContext, DateTime)`                | 曜日（Day of Week）のラベル部分をカスタマイズ。例：「月」「火」「水」など。    |
| **headerTitleBuilder** | `Widget Function(BuildContext, DateTime)`                 | カレンダー上部のヘッダー（例：2025年10月）をカスタマイズ。                     |
| **disabledBuilder**    | `Widget? Function(BuildContext, DateTime, DateTime)`      | 無効日（選択できない日）を描画するカスタム関数。                               |
| **rangeStartBuilder**  | `Widget? Function(BuildContext, DateTime, DateTime)`      | 範囲選択（range mode）の開始日セルの描画。                                     |
| **rangeEndBuilder**    | `Widget? Function(BuildContext, DateTime, DateTime)`      | 範囲選択の終了日セルの描画。                                                   |
| **withinRangeBuilder** | `Widget? Function(BuildContext, DateTime, DateTime)`      | 範囲選択の中間日セルの描画。                                                   |
| **outsideDaysBuilder** | `Widget? Function(BuildContext, DateTime, DateTime)`      | 現在の月以外の「外の日付」をカスタマイズ。                                     |
| **holidayBuilder**     | `Widget? Function(BuildContext, DateTime, DateTime)`      | 休日セルをカスタマイズ（`holidayPredicate` と連携）。                          |
| **disabledDayBuilder** | `Widget? Function(BuildContext, DateTime, DateTime)`      | 無効日（例：選択範囲外の日）をカスタマイズ。                                   |

## 🧭 よく使う主要ビルダー（実務で頻出）
| 順位 | 引数                   | 主な用途                                               |
| ---- | ---------------------- | ------------------------------------------------------ |
| ⭐️1   | **markerBuilder**      | 各日付の下にイベント（料理名など）を表示。最頻出。     |
| ⭐️2   | **selectedBuilder**    | 選択された日付の見た目（背景色など）を変更。           |
| ⭐️3   | **todayBuilder**       | 今日の日付を特別なスタイルにする（例：青い円で囲む）。 |
| ⭐️4   | **dowBuilder**         | 曜日ラベルを日本語化・色分け（日曜赤など）。           |
| ⭐️5   | **headerTitleBuilder** | 「October 2025」→「2025年10月」に変える。              |
| ⭐️6   | **defaultBuilder**     | 通常セル全体を独自UIに置き換えるとき。                 |


## 💡 使用イメージ（例：料理カレンダー）
```dart
calendarBuilders: CalendarBuilders(
  dowBuilder: (context, day) {
    // 曜日部分（例：日～土）
    final text = DateFormat.E('ja').format(day); // jaで日本語
    final isSunday = day.weekday == DateTime.sunday;
    final isSaturday = day.weekday == DateTime.saturday;

    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: isSunday
              ? Colors.red
              : isSaturday
                  ? Colors.blue
                  : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  },
  todayBuilder: (context, date, _) => Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.orangeAccent,
      shape: BoxShape.circle,
    ),
    child: Text("${date.day}", style: TextStyle(color: Colors.white)),
  ),
  markerBuilder: (context, date, events) {
    if (events.isEmpty) return null;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${date.day}"),
        ...events.take(2).map((e) => Text(
              e.toString(),
              style: TextStyle(fontSize: 10, color: Colors.blue),
              overflow: TextOverflow.ellipsis,
            )),
      ],
    );
  },
),

```

## 🧠 まとめ
| 目的                               | 使うビルダー                        |
| ---------------------------------- | ----------------------------------- |
| 日付セルを丸ごと変更したい         | `defaultBuilder`                    |
| 今日だけ特別に装飾したい           | `todayBuilder`                      |
| 選択した日を強調したい             | `selectedBuilder`                   |
| イベント（料理名など）を表示したい | `markerBuilder`                     |
| 曜日・ヘッダーを日本語化したい     | `dowBuilder` / `headerTitleBuilder` |
