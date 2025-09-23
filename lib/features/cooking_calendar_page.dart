import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CookingCalendarPage extends StatefulWidget {
  const CookingCalendarPage({super.key});

  @override
  State<CookingCalendarPage> createState() => _CookingCalendarPageState();
}

class _CookingCalendarPageState extends State<CookingCalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, String> _mealNotes = {};
  final _locale = 'ja_JP';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カレンダー'),
        backgroundColor: const Color(0xFFFFB74D),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFFFF9C4),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TableCalendar(
                locale: _locale,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Color(0xFFFFB74D),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFFFFA726),
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(color: Colors.deepOrange),
                  defaultTextStyle: TextStyle(color: Colors.black87),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Color(0xFFFFA726),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Color(0xFFFFA726),
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Color(0xFFFFA726),
                  ),
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  _showMealInputDialog(selectedDay);
                },
              ),
            ),
            if (_selectedDay != null && _mealNotes[_selectedDay] != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Card(
                  color: const Color(0xFFFFE082),
                  child: ListTile(
                    title: Text(
                      '${_selectedDay!.year}年${_selectedDay!.month}月${_selectedDay!.day}日 の料理',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_mealNotes[_selectedDay] ?? ''),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showMealInputDialog(DateTime day) {
    final controller = TextEditingController(text: _mealNotes[day] ?? '');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFFF9C4),
          title: Text('${day.year}年${day.month}月${day.day}日の料理内容'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: '料理内容を入力してください',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              child: const Text('キャンセル'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB74D),
                foregroundColor: Colors.white,
              ),
              child: const Text('保存'),
              onPressed: () {
                setState(() {
                  _mealNotes[day] = controller.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
