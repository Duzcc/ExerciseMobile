# Lab 4 – Flutter UI Fundamentals

> Tài liệu hướng dẫn chi tiết + source code mẫu cho 5 exercise của **Module 4 – Flutter UI Fundamentals**.

---

## 1. Mục tiêu (Objective)

Lab này giúp sinh viên thực hành xây dựng giao diện người dùng bằng hệ thống widget cốt lõi của Flutter. Sinh viên sẽ học cách làm việc với:

- Widget cơ bản (basic widgets)
- Widget nhập liệu (input controls)
- Cấu trúc layout (layout structures)
- Khung điều hướng màn hình (navigation scaffolding)
- Kỹ thuật hoàn thiện giao diện: spacing, theming

## 2. Yêu cầu chung (Requirements)

Hoàn thành **5 exercise** bao phủ các khái niệm UI chính:

| # | Exercise | Chủ đề |
|---|----------|--------|
| 1 | Core Widgets | Text, Image, Icon, Card, ListTile |
| 2 | Input Widgets | Slider, Switch, RadioListTile, Pickers |
| 3 | Layout Composition | Column, Row, Padding, ListView |
| 4 | App Structure | Scaffold, AppBar, FAB, ThemeData |
| 5 | Debug & Fix | Sửa lỗi UI thường gặp |

**Tất cả các task phải:**
- ✅ Compile và chạy được trên Android Studio / VS Code / DartPad
- ✅ Cho ra kết quả UI hiển thị được (visible UI output)
- ✅ Có comment giải thích code
- ✅ Có screenshot minh họa (nếu giảng viên yêu cầu)

---

## 3. Hướng dẫn chi tiết từng Exercise

### Exercise 1 – Core Widgets: Text, Image, Icon, Card, ListTile

**Mục tiêu:** Xây dựng một màn hình đơn giản minh họa các widget hiển thị cốt lõi của Flutter.

**Các bước thực hiện:**
1. Tạo file mới `core_widgets_demo.dart`.
2. Xây dựng màn hình gồm:
   - Một `Text` tiêu đề (headline)
   - Một `Icon` sử dụng Material Icons
   - Một `Image.network()` (ảnh hợp lệ bất kỳ)
   - Một `Card` chứa `ListTile`
3. Chạy UI và kiểm tra các widget hiển thị đúng.

**Source code mẫu – `core_widgets_demo.dart`:**

```dart
import 'package:flutter/material.dart';

// Exercise 1: Demo các widget hiển thị cốt lõi của Flutter
// (Text, Icon, Image, Card, ListTile)
class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Headline Text
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // 2. Icon sử dụng Material Icons
            const Icon(
              Icons.movie,
              size: 48,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),

            // 3. Image.network() - hiển thị ảnh từ URL
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/400/200',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                // Xử lý khi ảnh lỗi/không load được
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Không tải được ảnh')),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 4. Card chứa ListTile
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: const Text('Movie Item'),
                subtitle: const Text('This is a sample ListTile inside a Card.'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Xử lý khi người dùng nhấn vào ListTile
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Bạn vừa nhấn vào Movie Item')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

> 💡 **Ghi chú:** Nếu chạy trên DartPad hoặc môi trường không có mạng, có thể thay `Image.network()` bằng `Image.asset()` với ảnh local trong thư mục `assets/`.

---

### Exercise 2 – Input Widgets: Slider, Switch, RadioListTile, DatePicker

**Mục tiêu:** Xây dựng UI tương tác cho phép người dùng điều khiển giá trị.

**Các bước thực hiện:**
1. Tạo `StatefulWidget` tên `InputControlsDemo`.
2. Triển khai `Slider`, `Switch`, và nhóm `RadioListTile`.
3. Thêm nút hiển thị `DatePicker` khi nhấn.
4. Hiển thị giá trị cập nhật trên màn hình.

**Source code mẫu – `input_controls_demo.dart`:**

```dart
import 'package:flutter/material.dart';

// Exercise 2: Demo các widget nhập liệu tương tác
class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  // State cho Slider
  double _rating = 50;

  // State cho Switch
  bool _isActive = false;

  // State cho RadioListTile (chọn 1 trong các genre)
  String? _selectedGenre;

  // State cho DatePicker
  DateTime? _selectedDate;

  // Hàm mở DatePicker - phải gọi từ context hợp lệ (nằm trong widget tree)
  Future<void> _openDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      // Luôn gọi setState() sau khi có kết quả để cập nhật UI
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2 – Input Controls')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // --- Slider ---
            const Text('Rating (Slider)', style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: _rating,
              min: 0,
              max: 100,
              divisions: 100,
              label: _rating.round().toString(),
              onChanged: (value) {
                setState(() {
                  _rating = value; // Cập nhật giá trị mỗi khi kéo slider
                });
              },
            ),
            Text('Current value: ${_rating.round()}'),
            const Divider(height: 32),

            // --- Switch ---
            const Text('Active (Switch)', style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text('Is movie active?'),
              value: _isActive,
              onChanged: (value) {
                setState(() {
                  _isActive = value;
                });
              },
            ),
            const Divider(height: 32),

            // --- RadioListTile group ---
            const Text('Genre (RadioListTile)', style: TextStyle(fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _selectedGenre,
              onChanged: (value) {
                setState(() {
                  _selectedGenre = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _selectedGenre,
              onChanged: (value) {
                setState(() {
                  _selectedGenre = value;
                });
              },
            ),
            Text('Selected genre: ${_selectedGenre ?? "None"}'),
            const Divider(height: 32),

            // --- DatePicker ---
            ElevatedButton(
              onPressed: _openDatePicker,
              child: const Text('Open Date Picker'),
            ),
            const SizedBox(height: 8),
            Text(
              _selectedDate == null
                  ? 'No date selected'
                  : 'Selected date: ${_selectedDate!.toLocal()}'.split(' ')[0],
            ),
          ],
        ),
      ),
    );
  }
}
```

---

### Exercise 3 – Layout Basics: Column, Row, Padding, ListView

**Mục tiêu:** Xây dựng bố cục UI có phân đoạn giống màn hình Home của một app thực tế.

**Các bước thực hiện:**
1. Dùng `Column` để tạo các phần theo chiều dọc.
2. Thêm khoảng cách bằng `Padding` và `SizedBox`.
3. Thêm `ListView.builder` hiển thị danh sách phim/item.
4. Áp dụng spacing nhất quán (8, 12, hoặc 16px).

**Source code mẫu – `layout_demo.dart`:**

```dart
import 'package:flutter/material.dart';

// Exercise 3: Demo bố cục Column + Row + ListView.builder
class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  // Dữ liệu mẫu cho ListView
  final List<Map<String, String>> movies = const [
    {'title': 'Avatar', 'desc': 'Sample description'},
    {'title': 'Inception', 'desc': 'Sample description'},
    {'title': 'Interstellar', 'desc': 'Sample description'},
    {'title': 'Joker', 'desc': 'Sample description'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 3 – Layout Demo')),
      // Column làm khung tổng thể, chia thành các "section"
      body: Column(
        children: [
          // Section 1: Tiêu đề, có Padding bao quanh
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: const Text(
              'Now Playing',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // Khoảng cách cố định bằng SizedBox
          const SizedBox(height: 8),

          // Section 2: Danh sách phim - dùng Expanded để ListView
          // chiếm phần không gian còn lại trong Column (tránh lỗi overflow)
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  // Spacing nhất quán 12px giữa các item
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Card(
                    child: ListTile(
                      // Row ngầm định bên trong ListTile: leading - content - trailing
                      leading: CircleAvatar(
                        child: Text(movie['title']![0]),
                      ),
                      title: Text(movie['title']!),
                      subtitle: Text(movie['desc']!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

> 💡 **Ghi chú kỹ thuật:** Đây chính là kỹ thuật được nhắc tới trong Exercise 5 (mục 1) – đặt `ListView` bên trong `Column` phải bọc bằng `Expanded` (hoặc `Flexible`), nếu không sẽ gây lỗi *"RenderBox was not laid out"*.

---

### Exercise 4 – App Structure with Scaffold, AppBar, FAB & Theme

**Mục tiêu:** Thực hành xây dựng cấu trúc màn hình hoàn chỉnh.

**Các bước thực hiện:**
1. Tạo màn hình mới dùng `Scaffold`.
2. Thêm: `AppBar`, `Body`, `FloatingActionButton`, tùy chỉnh `ThemeData`.
3. Triển khai chuyển đổi "Dark Mode" bằng `themeMode`.

**Source code mẫu – `app_structure_demo.dart` (bao gồm cả `main.dart` để chạy độc lập):**

```dart
import 'package:flutter/material.dart';

void main() => runApp(const AppStructureRoot());

// Root widget quản lý themeMode (Light/Dark) ở cấp App
class AppStructureRoot extends StatefulWidget {
  const AppStructureRoot({super.key});

  @override
  State<AppStructureRoot> createState() => _AppStructureRootState();
}

class _AppStructureRootState extends State<AppStructureRoot> {
  // State lưu chế độ theme hiện tại
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 4 Demo',
      themeMode: _themeMode,
      // Theme cho chế độ sáng
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      // Theme cho chế độ tối
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: AppStructureDemo(
        isDark: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

// Exercise 4: Demo cấu trúc Scaffold hoàn chỉnh
class AppStructureDemo extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const AppStructureDemo({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure'),
        actions: [
          // Toggle Dark Mode ngay trên AppBar
          Row(
            children: [
              const Text('Dark'),
              Switch(
                value: isDark,
                onChanged: onThemeChanged,
              ),
            ],
          ),
        ],
      ),

      // Body
      body: const Center(
        child: Text('This is a simple screen with theme toggle.'),
      ),

      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('FAB pressed!')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

---

### Exercise 5 – Debug & Fix Common UI Errors

**Mục tiêu:** Hiểu các vấn đề layout thường gặp và cách khắc phục.

**Các task cần thực hiện:**
1. Sửa lỗi **ListView bên trong Column** bằng `Expanded`.
2. Sửa lỗi **overflow** trên màn hình nhỏ bằng `SingleChildScrollView`.
3. Sửa lỗi state không cập nhật bằng cách thêm `setState()`.
4. Sửa lỗi `DatePicker` build context bằng cách gọi từ widget tree hợp lệ.

**Source code mẫu – `common_ui_fixes.dart` (mỗi lỗi trình bày dạng "Sai" → "Đúng"):**

```dart
import 'package:flutter/material.dart';

// Exercise 5: Tổng hợp các lỗi UI thường gặp và cách sửa

// ---------------------------------------------------------
// LỖI 1: ListView bên trong Column không có Expanded
// ---------------------------------------------------------

// ❌ SAI - sẽ ném lỗi:
// "Vertical viewport was given unbounded height"
// vì ListView cố chiếm chiều cao vô hạn bên trong Column
class BuggyListInColumn extends StatelessWidget {
  const BuggyListInColumn({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Header'),
        // ListView không có ràng buộc chiều cao -> lỗi
        // ListView(children: [...]),
      ],
    );
  }
}

// ✅ ĐÚNG - bọc ListView bằng Expanded để nó nhận
// phần không gian còn lại của Column
class FixedListInColumn extends StatelessWidget {
  const FixedListInColumn({super.key});
  @override
  Widget build(BuildContext context) {
    final movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – Common UI Fixes'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Correct ListView inside Column using Expanded',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.movie),
                title: Text(movies[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// LỖI 2: Overflow trên màn hình nhỏ
// ---------------------------------------------------------

// ❌ SAI - nội dung dài trong Column cố định sẽ tràn màn hình
// (gây lỗi "BOTTOM OVERFLOWED BY x PIXELS")
class BuggyOverflow extends StatelessWidget {
  const BuggyOverflow({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        30,
        (i) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Item $i'),
        ),
      ),
    );
  }
}

// ✅ ĐÚNG - bọc nội dung bằng SingleChildScrollView để
// nó có thể cuộn khi nội dung vượt quá chiều cao màn hình
class FixedOverflow extends StatelessWidget {
  const FixedOverflow({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          30,
          (i) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Item $i'),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// LỖI 3: State không cập nhật (thiếu setState())
// ---------------------------------------------------------

// ❌ SAI - thay đổi biến trực tiếp không gọi setState()
// -> UI không re-build, giá trị hiển thị không đổi
class BuggyCounter extends StatefulWidget {
  const BuggyCounter({super.key});
  @override
  State<BuggyCounter> createState() => _BuggyCounterState();
}

class _BuggyCounterState extends State<BuggyCounter> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _count++; // Thiếu setState() -> UI không cập nhật
      },
      child: Text('Count: $_count'),
    );
  }
}

// ✅ ĐÚNG - luôn gọi setState() khi thay đổi dữ liệu
// ảnh hưởng đến giao diện
class FixedCounter extends StatefulWidget {
  const FixedCounter({super.key});
  @override
  State<FixedCounter> createState() => _FixedCounterState();
}

class _FixedCounterState extends State<FixedCounter> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _count++; // Bọc trong setState() -> Flutter rebuild widget
        });
      },
      child: Text('Count: $_count'),
    );
  }
}

// ---------------------------------------------------------
// LỖI 4: DatePicker build context không hợp lệ
// ---------------------------------------------------------

// ❌ SAI - gọi showDatePicker() với context lấy từ ngoài
// cây widget hợp lệ (ví dụ trong hàm static, hoặc trước khi
// widget được build xong) -> lỗi "Navigator operation requested
// with a context that does not include a Navigator"
class BuggyDatePicker {
  static void openPicker(BuildContext someOldContext) {
    // showDatePicker(context: someOldContext, ...); // có thể lỗi
  }
}

// ✅ ĐÚNG - luôn gọi showDatePicker() bên trong một callback
// (ví dụ onPressed) của widget đang nằm trong cây widget hiện tại,
// dùng context của chính build() method đó
class FixedDatePicker extends StatefulWidget {
  const FixedDatePicker({super.key});
  @override
  State<FixedDatePicker> createState() => _FixedDatePickerState();
}

class _FixedDatePickerState extends State<FixedDatePicker> {
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // context ở đây hợp lệ vì lấy trực tiếp từ build() hiện tại
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          setState(() => _date = picked);
        }
      },
      child: Text(_date == null ? 'Pick a date' : _date.toString()),
    );
  }
}
```

**Giải thích ngắn cho phần "Short explanation for fixes" (nộp bài):**

| Lỗi | Nguyên nhân | Cách sửa |
|-----|-------------|----------|
| ListView trong Column | `ListView` mặc định muốn chiều cao vô hạn, `Column` cũng không giới hạn chiều cao con → xung đột ràng buộc | Bọc `ListView` bằng `Expanded` (hoặc `Flexible`) để nó nhận phần không gian còn lại |
| Overflow trên màn hình nhỏ | Nội dung trong `Column`/`Row` vượt quá kích thước khả dụng của màn hình | Bọc nội dung bằng `SingleChildScrollView` để có thể cuộn |
| State không cập nhật | Thay đổi biến nhưng không gọi `setState()` nên Flutter không biết để rebuild widget | Luôn đặt các thay đổi ảnh hưởng UI bên trong `setState(() { ... })` |
| DatePicker context lỗi | `context` dùng để gọi `showDatePicker()` không nằm trong `Navigator` hợp lệ (ví dụ gọi từ hàm static hoặc trước khi widget mount) | Luôn lấy `context` từ bên trong `build()` của widget đang hiển thị, gọi trong callback như `onPressed` |

---

## 4. Kết quả mong đợi (Expected Results)

Sau khi hoàn thành lab này, sinh viên có thể:
- ✅ Xây dựng UI bằng các widget cốt lõi của Flutter
- ✅ Xử lý widget nhập liệu và picker
- ✅ Kết hợp layout phức tạp bằng Column/Row/ListView
- ✅ Cấu trúc màn hình bằng Scaffold & Theme
- ✅ Nhận diện và sửa các lỗi UI thường gặp
- ✅ Tạo ra màn hình Flutter UI hiển thị được và chạy được

## 5. Nộp bài (Submission)

Checklist trước khi nộp:

- [ ] Source code đầy đủ cho cả 5 exercise
- [ ] Screenshot kết quả UI cho từng exercise
- [ ] Giải thích ngắn gọn cho các fix ở Exercise 5
- [ ] Nộp qua LMS hoặc upload project dạng file nén (.zip)

### Gợi ý cấu trúc thư mục project khi nộp

```
lab4_flutter_ui/
├── lib/
│   ├── main.dart
│   ├── exercise1_core_widgets_demo.dart
│   ├── exercise2_input_controls_demo.dart
│   ├── exercise3_layout_demo.dart
│   ├── exercise4_app_structure_demo.dart
│   └── exercise5_common_ui_fixes.dart
├── screenshots/
│   ├── exercise1.png
│   ├── exercise2.png
│   ├── exercise3.png
│   ├── exercise4.png
│   └── exercise5.png
└── README.md   (giải thích ngắn các fix ở Exercise 5)
```
