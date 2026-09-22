import 'package:flutter/material.dart';
import '../../widgets/section_header.dart';

/// Exercise 2: Demo các widget nhập liệu tương tác trong Flutter
/// Bao gồm: Slider, SwitchListTile, RadioListTile, DatePicker
class InputControlsScreen extends StatefulWidget {
  const InputControlsScreen({super.key});

  @override
  State<InputControlsScreen> createState() => _InputControlsScreenState();
}

class _InputControlsScreenState extends State<InputControlsScreen> {
  // State 1: Giá trị Slider (đánh giá / điểm số từ 0 - 100)
  double _rating = 65.0;

  // State 2: Giá trị Switch (trạng thái kích hoạt)
  bool _isActive = true;

  // State 3: Thể loại phim được chọn trong nhóm RadioListTile
  String _selectedGenre = 'Action';

  // State 4: Ngày được chọn từ DatePicker
  DateTime? _selectedDate;

  /// Hàm mở DatePicker an toàn từ BuildContext của widget tree
  Future<void> _openDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      helpText: 'CHỌN NGÀY CÔNG CHIẾU',
      cancelText: 'HỦY',
      confirmText: 'CHỌN',
    );

    // Luôn gọi setState() để cập nhật giá trị vào UI
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 – Input Controls'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Bảng tóm tắt kết quả theo thời gian thực
          Card(
            color: theme.colorScheme.primaryContainer.withAlpha(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: theme.colorScheme.primary.withAlpha(60)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.dashboard_customize, color: theme.colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Giá trị đang chọn (Live Preview):',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 16),
                  Text('• Điểm đánh giá: ${_rating.round()}/100'),
                  Text('• Trạng thái chiếu: ${_isActive ? "Đang chiếu (Active)" : "Tạm dừng (Inactive)"}'),
                  Text('• Thể loại phim: $_selectedGenre'),
                  Text(
                    '• Ngày khởi chiếu: ${_selectedDate == null ? "Chưa chọn ngày" : "${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year}"}',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 1. Slider Widget
          const SectionHeader(
            title: '1. Slider Widget',
            subtitle: 'Thanh trượt điều chỉnh giá trị từ 0 đến 100',
            icon: Icons.tune,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Slider(
                    value: _rating,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: '${_rating.round()} điểm',
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),
                  Text(
                    'Giá trị hiện tại: ${_rating.round()}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 2. SwitchListTile Widget
          const SectionHeader(
            title: '2. Switch Widget',
            subtitle: 'Nút gạt bật / tắt trạng thái',
            icon: Icons.toggle_on,
          ),
          Card(
            child: SwitchListTile(
              title: const Text('Kích hoạt phim (Is Active?)'),
              subtitle: Text(
                _isActive ? 'Phim đang mở bán vé' : 'Phim đã ngừng bán vé',
              ),
              value: _isActive,
              secondary: Icon(
                _isActive ? Icons.check_circle : Icons.pause_circle_outline,
                color: _isActive ? Colors.green : Colors.grey,
              ),
              onChanged: (value) {
                setState(() {
                  _isActive = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16),

          // 3. RadioListTile Group Widget
          const SectionHeader(
            title: '3. RadioListTile Group Widget',
            subtitle: 'Chọn duy nhất 1 tùy chọn trong nhóm thể loại',
            icon: Icons.radio_button_checked,
          ),
          Card(
            child: RadioGroup<String>(
              groupValue: _selectedGenre,
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedGenre = value);
                }
              },
              child: const Column(
                children: [
                  RadioListTile<String>(
                    title: Text('Hành động (Action)'),
                    value: 'Action',
                  ),
                  RadioListTile<String>(
                    title: Text('Hài hước (Comedy)'),
                    value: 'Comedy',
                  ),
                  RadioListTile<String>(
                    title: Text('Khoa học viễn tưởng (Sci-Fi)'),
                    value: 'Sci-Fi',
                  ),
                  RadioListTile<String>(
                    title: Text('Kinh dị (Horror)'),
                    value: 'Horror',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 4. DatePicker Widget
          const SectionHeader(
            title: '4. DatePicker Dialog',
            subtitle: 'Hộp thoại chọn ngày từ lịch hệ thống',
            icon: Icons.calendar_month,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Chưa chọn ngày công chiếu'
                          : 'Ngày đã chọn: ${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _openDatePicker,
                    icon: const Icon(Icons.calendar_today, size: 18),
                    label: const Text('Chọn ngày'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
