import 'package:flutter/material.dart';
import '../../widgets/fix_demo_card.dart';

/// Exercise 5: Debug & Fix 4 lỗi giao diện thường gặp nhất trong Flutter
/// 1. ListView trong Column không có ràng buộc chiều cao (Fix: dùng Expanded)
/// 2. Overflow tràn màn hình (Fix: dùng SingleChildScrollView)
/// 3. Không cập nhật UI do thiếu setState() (Fix: bọc trong setState())
/// 4. Lỗi BuildContext của DatePicker (Fix: gọi showDatePicker trong callback với context hợp lệ)
class CommonUiFixesScreen extends StatefulWidget {
  const CommonUiFixesScreen({super.key});

  @override
  State<CommonUiFixesScreen> createState() => _CommonUiFixesScreenState();
}

class _CommonUiFixesScreenState extends State<CommonUiFixesScreen> {
  // State cho Demo 3: Bộ đếm có setState
  int _counter = 0;

  // State cho Demo 4: Ngày được chọn từ DatePicker an toàn
  DateTime? _safePickedDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – Common UI Fixes'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        children: [
          // Banner đầu trang tóm tắt
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withAlpha(50),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.primary.withAlpha(70)),
              ),
              child: Row(
                children: [
                  Icon(Icons.bug_report, color: theme.colorScheme.primary, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Tổng hợp 4 lỗi UI kinh điển trong Flutter, phân tích nguyên nhân và minh họa giải pháp đã khắc phục.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // LỖI 1: ListView bên trong Column
          FixDemoCard(
            bugIndex: 1,
            title: 'ListView bên trong Column',
            bugExplanation:
                'Nguyên nhân: ListView mặc định cố chiếm chiều cao vô hạn (unbounded height), trong khi Column cũng không giới hạn chiều cao cho các con. Dẫn tới lỗi "Vertical viewport was given unbounded height".',
            fixExplanation:
                'Khắc phục: Bọc ListView bằng widget Expanded (hoặc Flexible) để giới hạn chiều cao bằng phần không gian khả dụng còn lại của Column.',
            fixedDemo: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Header Section (Cố định trong Column)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: ListView.separated(
                        itemCount: 5,
                        separatorBuilder: (context, index) => const Divider(height: 1),
                        itemBuilder: (context, index) => ListTile(
                          dense: true,
                          leading: const Icon(Icons.check_circle_outline, color: Colors.green, size: 18),
                          title: Text('Phim đề xuất số ${index + 1}'),
                          subtitle: const Text('Cuộn mượt mà trong Expanded'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // LỖI 2: Overflow màn hình nhỏ
          FixDemoCard(
            bugIndex: 2,
            title: 'Bottom Overflow trên màn hình nhỏ',
            bugExplanation:
                'Nguyên nhân: Sử dụng Column với danh sách phần tử vượt quá chiều cao màn hình thiết bị hoặc khi bàn phím ảo hiển thị, gây lỗi vạch vàng-đen "BOTTOM OVERFLOWED BY X PIXELS".',
            fixExplanation:
                'Khắc phục: Bọc nội dung trong SingleChildScrollView để toàn bộ màn hình có thể cuộn linh hoạt khi nội dung vượt quá kích thước.',
            fixedDemo: Container(
              height: 140,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: List.generate(
                    6,
                    (i) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withAlpha(20),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.touch_app, size: 16, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text('Nội dung dài cuộn tự do – Hàng thứ ${i + 1}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // LỖI 3: State không cập nhật do thiếu setState()
          FixDemoCard(
            bugIndex: 3,
            title: 'Dữ liệu thay đổi nhưng UI không cập nhật',
            bugExplanation:
                'Nguyên nhân: Thay đổi biến số trong callback (onPressed) nhưng quên bọc trong setState(). Flutter không nhận được thông báo để gọi lại phương thức build() tái vẽ giao diện.',
            fixExplanation:
                'Khắc phục: Luôn đặt lệnh thay đổi dữ liệu bên trong setState(() { _counter++; });',
            fixedDemo: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Bộ đếm cập nhật chuẩn:', style: TextStyle(fontSize: 12)),
                    Text(
                      '$_counter lần',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
                  icon: const Icon(Icons.add_circle, size: 18),
                  label: const Text('Bấm tăng'),
                ),
              ],
            ),
          ),

          // LỖI 4: BuildContext gọi DatePicker không hợp lệ
          FixDemoCard(
            bugIndex: 4,
            title: 'Lỗi BuildContext khi gọi DatePicker / Dialog',
            bugExplanation:
                'Nguyên nhân: Gọi showDatePicker() truyền vào context lấy ngoài cây Navigator (ví dụ hàm static không context, trước khi widget mount) gây lỗi "Navigator operation requested with a context that does not include a Navigator".',
            fixExplanation:
                'Khắc phục: Luôn gọi showDatePicker() bên trong callback (như onPressed) sử dụng context hợp lệ lấy từ chính hàm build() của Widget hiện tại.',
            fixedDemo: Row(
              children: [
                Expanded(
                  child: Text(
                    _safePickedDate == null
                        ? 'Chưa chọn ngày'
                        : 'Ngày: ${_safePickedDate!.day}/${_safePickedDate!.month}/${_safePickedDate!.year}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() {
                        _safePickedDate = picked;
                      });
                    }
                  },
                  icon: const Icon(Icons.event_available, size: 18),
                  label: const Text('Chọn an toàn'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
