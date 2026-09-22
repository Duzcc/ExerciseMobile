import 'package:flutter/material.dart';
import '../../widgets/section_header.dart';

/// Exercise 1: Minh họa các widget hiển thị cốt lõi của Flutter
/// Bao gồm: Text, Icon, Image.network, Card, ListTile
class CoreWidgetsScreen extends StatelessWidget {
  const CoreWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Headline Text
            const SectionHeader(
              title: '1. Headline Text Widget',
              subtitle: 'Hiển thị văn bản với định dạng font size, weight và color',
              icon: Icons.text_fields,
            ),
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
                'Welcome to Flutter UI Fundamentals!',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 2. Icon sử dụng Material Icons
            const SectionHeader(
              title: '2. Material Icon Widget',
              subtitle: 'Sử dụng hệ thống biểu tượng phong phú của Material Design',
              icon: Icons.star_border_rounded,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconItem(Icons.movie, 'Movie', Colors.blue),
                    _buildIconItem(Icons.favorite, 'Favorite', Colors.red),
                    _buildIconItem(Icons.thumb_up, 'Like', Colors.green),
                    _buildIconItem(Icons.share, 'Share', Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 3. Image.network() - hiển thị ảnh từ URL
            const SectionHeader(
              title: '3. Image.network Widget',
              subtitle: 'Tải và hiển thị ảnh từ URL với errorBuilder an toàn',
              icon: Icons.image,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://picsum.photos/600/300',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 180,
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image,
                            size: 48,
                            color: theme.colorScheme.error,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Không thể tải ảnh từ URL (Network unavailable)',
                            style: TextStyle(color: theme.colorScheme.error),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 4. Card chứa ListTile
            const SectionHeader(
              title: '4. Card & ListTile Widget',
              subtitle: 'Tổ chức item dạng danh sách có ảnh đại diện, tiêu đề và sự kiện nhấn',
              icon: Icons.view_list,
            ),
            Card(
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(Icons.star, color: theme.colorScheme.primary),
                ),
                title: const Text(
                  'Flutter Movie Item',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'This is a sample ListTile inside a Material Card component.',
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('🎉 Bạn vừa nhấn vào Movie Item!'),
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: 'Đóng',
                        onPressed: () {},
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

  Widget _buildIconItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, size: 36, color: color),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
