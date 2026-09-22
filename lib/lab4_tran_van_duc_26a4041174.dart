// ============================================================================
// BÀI NỘP THỰC HÀNH: LAB 4 – FLUTTER UI FUNDAMENTALS
// Sinh viên thực hiện : TRẦN VĂN ĐỨC
// Mã sinh viên        : 26A4041174
// GitHub Repository   : https://github.com/Duzcc/ExerciseMobile
// ----------------------------------------------------------------------------
// flutter run lib/lab4_tran_van_duc_26A4041174.dart
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Lab4SubmissionApp());
}

/// Ứng dụng gốc quản lý chế độ Dark / Light Mode
class Lab4SubmissionApp extends StatefulWidget {
  const Lab4SubmissionApp({super.key});

  @override
  State<Lab4SubmissionApp> createState() => _Lab4SubmissionAppState();
}

class _Lab4SubmissionAppState extends State<Lab4SubmissionApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 - Trần Văn Đức - 26A4041174',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: const Color(0xFF6750A4),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFF6750A4),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: Lab4HomeScreen(
        isDark: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

//Màn hình lựa chọn bài tập
class Lab4HomeScreen extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const Lab4HomeScreen({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 – UI Fundamentals'),
        actions: [
          IconButton(
            tooltip: isDark ? 'Chuyển sáng' : 'Chuyển tối',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => onThemeChanged(!isDark),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Banner thông tin sinh viên
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorScheme.primary, theme.colorScheme.tertiary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'SV: TRẦN VĂN ĐỨC • MSV: 26A4041174',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Lab 4: Flutter UI Fundamentals',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Bản nộp bài tổng hợp toàn bộ 5 bài tập Flutter UI trong 1 file .dart',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Menu bài tập 1
          _buildItem(
            context,
            1,
            'Exercise 1 – Core Widgets',
            'Text, Icon, Image.network, Card, ListTile',
            Icons.widgets,
            Colors.indigo,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Ex1CoreWidgets()),
            ),
          ),

          // Menu bài tập 2
          _buildItem(
            context,
            2,
            'Exercise 2 – Input Controls',
            'Slider, Switch, RadioGroup, DatePicker',
            Icons.tune,
            Colors.teal,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Ex2InputControls()),
            ),
          ),

          // Menu bài tập 3
          _buildItem(
            context,
            3,
            'Exercise 3 – Layout Basics',
            'Column, Row, Padding, SizedBox, ListView.builder + Expanded',
            Icons.view_quilt,
            Colors.orange.shade800,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Ex3LayoutBasics()),
            ),
          ),

          // Menu bài tập 4
          _buildItem(
            context,
            4,
            'Exercise 4 – App Structure & Theme',
            'Scaffold, AppBar, FloatingActionButton, Theme Toggle',
            Icons.layers,
            Colors.purple,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Ex4AppStructure(
                  isDark: isDark,
                  onThemeChanged: onThemeChanged,
                ),
              ),
            ),
          ),

          // Menu bài tập 5
          _buildItem(
            context,
            5,
            'Exercise 5 – Common UI Fixes',
            'Sửa 4 lỗi layout kinh điển: Unbounded height, Overflow, setState, Context',
            Icons.bug_report,
            Colors.red.shade700,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Ex5CommonUiFixes()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    int index,
    String title,
    String desc,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withAlpha(30),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        onTap: onTap,
      ),
    );
  }
}

// ============================================================================
// EXERCISE 1: CORE DISPLAY WIDGETS
// ============================================================================
class Ex1CoreWidgets extends StatelessWidget {
  const Ex1CoreWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1 – Core Widgets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Headline Text
            const Text(
              '1. Headline Text:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withAlpha(50),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.primary.withAlpha(60),
                ),
              ),
              child: Text(
                'Welcome to Flutter UI Fundamentals!\nSinh viên: Trần Văn Đức - 26A4041174',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2. Icon Widget
            const Text(
              '2. Material Icons:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.movie, size: 40, color: Colors.blue),
                Icon(Icons.favorite, size: 40, color: Colors.red),
                Icon(Icons.star, size: 40, color: Colors.amber),
                Icon(Icons.thumb_up, size: 40, color: Colors.green),
              ],
            ),
            const SizedBox(height: 16),

            // 3. Image.network (Logo NPA)
            const Text('3. Image.network Widget (Logo NPA):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 320, maxHeight: 200),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://raw.githubusercontent.com/Duzcc/ExerciseMobile/main/assets/images/npa_logo.jpg',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/npa_logo.jpg',
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 4. Card chứa ListTile
            const Text(
              '4. Card & ListTile:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: const Text('Movie Item (Card + ListTile)'),
                subtitle: const Text('Nhấn vào đây để xem SnackBar phản hồi'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        '🎉 Bạn vừa nhấn vào Movie Item của Trần Văn Đức!',
                      ),
                    ),
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

// ============================================================================
// EXERCISE 2: INPUT CONTROLS & PICKERS
// ============================================================================
class Ex2InputControls extends StatefulWidget {
  const Ex2InputControls({super.key});

  @override
  State<Ex2InputControls> createState() => _Ex2InputControlsState();
}

class _Ex2InputControlsState extends State<Ex2InputControls> {
  double _rating = 75.0;
  bool _isActive = true;
  String _selectedGenre = 'Action';
  DateTime? _selectedDate;

  Future<void> _openDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2 – Input Controls')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Live Preview Card
          Card(
            color: Theme.of(context).colorScheme.primaryContainer.withAlpha(50),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dữ liệu đang chọn (Live Preview):',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  Text('• Điểm Slider: ${_rating.round()}/100'),
                  Text(
                    '• Trạng thái Switch: ${_isActive ? "Bật (Active)" : "Tắt (Inactive)"}',
                  ),
                  Text('• Thể loại Radio: $_selectedGenre'),
                  Text(
                    '• Ngày DatePicker: ${_selectedDate == null ? "Chưa chọn" : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"}',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Slider
          const Text(
            '1. Slider Widget:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Slider(
            value: _rating,
            min: 0,
            max: 100,
            divisions: 100,
            label: '${_rating.round()}',
            onChanged: (v) => setState(() => _rating = v),
          ),
          const SizedBox(height: 12),

          // Switch
          const Text(
            '2. Switch Widget:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: const Text('Kích hoạt phim (Is movie active?)'),
            value: _isActive,
            onChanged: (v) => setState(() => _isActive = v),
          ),
          const SizedBox(height: 12),

          // RadioGroup
          const Text(
            '3. RadioListTile Group:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Card(
            child: RadioGroup<String>(
              groupValue: _selectedGenre,
              onChanged: (v) {
                if (v != null) setState(() => _selectedGenre = v);
              },
              child: const Column(
                children: [
                  RadioListTile<String>(title: Text('Action'), value: 'Action'),
                  RadioListTile<String>(title: Text('Comedy'), value: 'Comedy'),
                  RadioListTile<String>(title: Text('Sci-Fi'), value: 'Sci-Fi'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // DatePicker
          const Text(
            '4. DatePicker:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ElevatedButton.icon(
            onPressed: _openDatePicker,
            icon: const Icon(Icons.calendar_month),
            label: const Text('Mở DatePicker'),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// EXERCISE 3: LAYOUT BASICS (COLUMN, ROW, PADDING, SIZEDBOX, LISTVIEW)
// ============================================================================
class Ex3LayoutBasics extends StatelessWidget {
  const Ex3LayoutBasics({super.key});

  final List<Map<String, String>> movies = const [
    {'title': 'Avatar: The Way of Water', 'genre': 'Sci-Fi', 'rating': '7.8'},
    {'title': 'Inception', 'genre': 'Action / Sci-Fi', 'rating': '8.8'},
    {'title': 'Interstellar', 'genre': 'Sci-Fi / Drama', 'rating': '8.7'},
    {'title': 'The Dark Knight', 'genre': 'Action', 'rating': '9.0'},
    {'title': 'Joker', 'genre': 'Crime / Drama', 'rating': '8.4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 3 – Layout Basics')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section 1: Tiêu đề có Padding
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              'Danh sách phim nổi bật (Now Playing)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),

          // Section 2: ListView bọc trong Expanded để tránh lỗi unbounded height
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text(movie['title']![0])),
                      title: Text(
                        movie['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Thể loại: ${movie['genre']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            movie['rating']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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

// ============================================================================
// EXERCISE 4: APP STRUCTURE WITH SCAFFOLD, APPBAR, FAB & THEME
// ============================================================================
class Ex4AppStructure extends StatefulWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const Ex4AppStructure({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  State<Ex4AppStructure> createState() => _Ex4AppStructureState();
}

class _Ex4AppStructureState extends State<Ex4AppStructure> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure'),
        actions: [
          Row(
            children: [
              const Text('Dark'),
              Switch(value: widget.isDark, onChanged: widget.onThemeChanged),
            ],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.palette,
                size: 64,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              const Text(
                'Demo cấu trúc Scaffold + ThemeData',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Chế độ hiện tại: ${widget.isDark ? "Dark Theme" : "Light Theme"}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Text(
                'Số lần bấm FAB: $_counter',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _counter++);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('FAB clicked! Bộ đếm: $_counter'),
              duration: const Duration(milliseconds: 800),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ============================================================================
// EXERCISE 5: DEBUG & FIX 4 COMMON UI ERRORS
// ============================================================================
class Ex5CommonUiFixes extends StatefulWidget {
  const Ex5CommonUiFixes({super.key});

  @override
  State<Ex5CommonUiFixes> createState() => _Ex5CommonUiFixesState();
}

class _Ex5CommonUiFixesState extends State<Ex5CommonUiFixes> {
  int _counter = 0;
  DateTime? _fixedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 5 – Common UI Fixes')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Lỗi 1
          _buildFixCard(
            1,
            'Lỗi 1: ListView bên trong Column',
            'Nguyên nhân: ListView cố lấy unbounded height bên trong Column.',
            'Cách sửa: Bọc ListView bằng widget Expanded.',
            SizedBox(
              height: 110,
              child: Column(
                children: [
                  const Text('Header cố định trong Column'),
                  Expanded(
                    child: ListView(
                      children: const [
                        ListTile(
                          dense: true,
                          title: Text('Item 1 (trong Expanded)'),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Item 2 (trong Expanded)'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Lỗi 2
          _buildFixCard(
            2,
            'Lỗi 2: Overflow trên màn hình nhỏ',
            'Nguyên nhân: Column chứa nhiều widget vượt quá chiều cao màn hình.',
            'Cách sửa: Bọc nội dung bằng SingleChildScrollView để có thể cuộn dọc.',
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: List.generate(
                    5,
                    (i) => Text('Dòng thứ ${i + 1} có thể cuộn mượt mà'),
                  ),
                ),
              ),
            ),
          ),

          // Lỗi 3
          _buildFixCard(
            3,
            'Lỗi 3: State không cập nhật UI do thiếu setState()',
            'Nguyên nhân: Thay đổi biến nhưng không bọc trong setState() nên Flutter không rebuild.',
            'Cách sửa: Luôn đặt lệnh thay đổi dữ liệu trong setState(() { ... }).',
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Giá trị: $_counter',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _counter++),
                  child: const Text('Tăng (có setState)'),
                ),
              ],
            ),
          ),

          // Lỗi 4
          _buildFixCard(
            4,
            'Lỗi 4: BuildContext gọi DatePicker không hợp lệ',
            'Nguyên nhân: Gọi showDatePicker với context ngoài cây Navigator.',
            'Cách sửa: Gọi showDatePicker trong callback (onPressed) với context hợp lệ từ build().',
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _fixedDate == null
                      ? 'Chưa chọn ngày'
                      : '${_fixedDate!.day}/${_fixedDate!.month}/${_fixedDate!.year}',
                ),
                ElevatedButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() => _fixedDate = picked);
                    }
                  },
                  child: const Text('Chọn ngày an toàn'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFixCard(
    int index,
    String title,
    String cause,
    String fix,
    Widget demo,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 6),
            Text(
              '❌ $cause',
              style: TextStyle(color: Colors.red.shade800, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              '✅ $fix',
              style: TextStyle(color: Colors.green.shade800, fontSize: 12),
            ),
            const SizedBox(height: 10),
            const Text(
              'Demo trực tiếp:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            demo,
          ],
        ),
      ),
    );
  }
}
