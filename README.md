# BÁO CÁO BÀI TẬP: LAB 4 – FLUTTER UI FUNDAMENTALS

- **Sinh viên thực hiện:** Trần Văn Đức
- **Mã sinh viên:** 26A4041174
- **Repository GitHub:** [https://github.com/Duzcc/ExerciseMobile](https://github.com/Duzcc/ExerciseMobile)
- **Học phần:** Lập trình ứng dụng di động (Flutter)

---

## 📁 Cấu trúc thư mục dự án (Clean Architecture)

```
lib/
├── app/                                # Cấu hình ứng dụng và Theme
│   ├── app.dart                        # MaterialApp cấu hình routes, themeMode
│   └── theme/
│       └── app_theme.dart              # Thiết lập ThemeData (Light & Dark chuẩn Material 3)
├── screens/                            # Các màn hình chức năng chính
│   ├── home_screen.dart                # Dashboard trung tâm điều hướng 5 Exercise
│   ├── exercise1/
│   │   └── core_widgets_screen.dart    # Exercise 1: Text, Icon, Image, Card, ListTile
│   ├── exercise2/
│   │   └── input_controls_screen.dart  # Exercise 2: Slider, Switch, Radio, DatePicker
│   ├── exercise3/
│   │   └── layout_screen.dart          # Exercise 3: Column, Row, Padding, ListView.builder + Expanded
│   ├── exercise4/
│   │   └── app_structure_screen.dart   # Exercise 4: Scaffold, AppBar, FAB, Theme Toggle
│   └── exercise5/
│       └── common_ui_fixes_screen.dart # Exercise 5: Debug & Fix 4 lỗi UI kinh điển
├── widgets/                            # Các Custom Widgets tái sử dụng
│   ├── exercise_card.dart              # Card bài tập ở màn hình Home
│   ├── fix_demo_card.dart              # Card so sánh trực quan lỗi và bản sửa trong Ex 5
│   └── section_header.dart             # Header tiêu đề đề mục chuẩn hóa
├── core_widgets_demo.dart              # File chạy độc lập cho Exercise 1
├── input_controls_demo.dart            # File chạy độc lập cho Exercise 2
├── layout_demo.dart                    # File chạy độc lập cho Exercise 3
├── app_structure_demo.dart             # File chạy độc lập cho Exercise 4
├── common_ui_fixes.dart                # File chạy độc lập cho Exercise 5
├── lab4_tran_van_duc_26a4041174.dart   # FILE .DART TỔNG HỢP TOÀN BỘ BÀI NỘP
└── main.dart                           # Điểm khởi chạy chính của toàn bộ ứng dụng
```

---

## 🚀 Hướng dẫn chạy ứng dụng

### 1. Chạy toàn bộ ứng dụng qua Dashboard
```bash
flutter run
# Hoặc chỉ định thiết bị:
flutter run -d chrome
flutter run -d macos
```

### 2. Chạy file tổng hợp nộp bài duy nhất (All-in-one)
```bash
flutter run -t lib/lab4_tran_van_duc_26a4041174.dart
```

### 3. Chạy từng bài tập riêng lẻ
```bash
flutter run -t lib/core_widgets_demo.dart
flutter run -t lib/input_controls_demo.dart
flutter run -t lib/layout_demo.dart
flutter run -t lib/app_structure_demo.dart
flutter run -t lib/common_ui_fixes.dart
```

---

## 📝 Giải thích chi tiết 4 bản sửa lỗi trong Exercise 5 (Submission Notes)

| STT | Tên Lỗi UI | Nguyên nhân (Root Cause) | Giải pháp khắc phục (Fix Solution) |
|:---:|:---|:---|:---|
| **1** | **ListView bên trong Column** | `ListView` mặc định cố gắng chiếm chiều cao vô hạn (`unbounded height`), trong khi `Column` cũng không đặt giới hạn chiều cao cho các widget con. Sự xung đột này khiến Flutter ném lỗi: `Vertical viewport was given unbounded height`. | Bọc `ListView` bằng widget `Expanded` (hoặc `Flexible`). `Expanded` sẽ giới hạn chiều cao của `ListView` bằng đúng phần không gian trống còn lại trong `Column`. |
| **2** | **Bottom Overflow trên màn hình nhỏ** | Khi số lượng widget con trong `Column` có tổng chiều cao vượt quá kích thước màn hình thiết bị hoặc khi bàn phím ảo hiển thị, màn hình không thể cuộn tự nhiên, dẫn đến lỗi vạch vàng đen: `BOTTOM OVERFLOWED BY X PIXELS`. | Bọc nội dung hoặc `Column` bằng `SingleChildScrollView` (hoặc chuyển sang `ListView`). Điều này giúp toàn bộ layout có thể cuộn linh hoạt theo trục dọc. |
| **3** | **State không cập nhật** | Thay đổi giá trị của biến trạng thái (State) trong các sự kiện tương tác (ví dụ: `onPressed`, `onChanged`) nhưng không bọc trong hàm `setState()`. Do đó, Flutter không nhận được tín hiệu dirty để kích hoạt lại chu trình `build()` vẽ lại giao diện. | Luôn đặt lệnh gán giá trị biến trạng thái bên trong hàm `setState(() { ... })`. Khi đó framework sẽ tự động rebuild cây widget tương ứng. |
| **4** | **BuildContext DatePicker không hợp lệ** | Gọi hàm `showDatePicker(context: ...)` nhưng truyền vào `BuildContext` không nằm trong một `Navigator` hợp lệ (ví dụ: gọi từ hàm static bên ngoài, hoặc gọi trước khi widget được gắn vào widget tree). Dẫn tới lỗi `Navigator operation requested with a context that does not include a Navigator`. | Luôn gọi `showDatePicker()` bên trong một callback sự kiện (như `onPressed`), sử dụng chính `context` hợp lệ được cung cấp bởi hàm `build()` của widget con nằm bên dưới `MaterialApp`/`Scaffold`. |

---

## 👨‍🎓 Tác giả
- **Sinh viên:** Trần Văn Đức
- **Mã sinh viên:** 26A4041174
- **GitHub:** [https://github.com/Duzcc/ExerciseMobile](https://github.com/Duzcc/ExerciseMobile)
