import 'package:flutter/material.dart';

/// Exercise 3: Thực hành bố cục phân vùng bằng Column, Row, Padding, SizedBox và ListView.builder
class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  // Dữ liệu mẫu danh sách phim
  final List<Map<String, dynamic>> movies = const [
    {
      'title': 'Avatar: The Way of Water',
      'desc': 'Jake Sully lives with his newfound family formed on the extrasolar moon Pandora.',
      'rating': 7.6,
      'genre': 'Sci-Fi',
      'duration': '192m',
    },
    {
      'title': 'Inception',
      'desc': 'A thief who steals corporate secrets through dream-sharing technology.',
      'rating': 8.8,
      'genre': 'Action',
      'duration': '148m',
    },
    {
      'title': 'Interstellar',
      'desc': 'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot is tasked to pilot a spacecraft.',
      'rating': 8.7,
      'genre': 'Sci-Fi',
      'duration': '169m',
    },
    {
      'title': 'The Dark Knight',
      'desc': 'When the menace known as the Joker wreaks havoc and chaos on Gotham.',
      'rating': 9.0,
      'genre': 'Action',
      'duration': '152m',
    },
    {
      'title': 'Joker',
      'desc': 'A mentally troubled stand-up comedian embarks on a downward spiral that leads to revolution.',
      'rating': 8.4,
      'genre': 'Drama',
      'duration': '122m',
    },
    {
      'title': 'Spider-Man: Across the Spider-Verse',
      'desc': 'Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People.',
      'rating': 8.7,
      'genre': 'Animation',
      'duration': '140m',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 – Layout Composition'),
      ),
      // Column làm khung bố cục chính phân chia theo chiều dọc
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section 1: Header banner với Padding chuẩn 16px
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Now Playing in Theaters',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4), // SizedBox 4px
                    Text(
                      'Showing ${movies.length} featured movies',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                IconButton.filledTonal(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Filter feature clicked')),
                    );
                  },
                  icon: const Icon(Icons.filter_list),
                ),
              ],
            ),
          ),

          // Spacing cố định bằng SizedBox chuẩn 8px
          const SizedBox(height: 8),

          // Section 2: Danh sách phim
          // KỸ THUẬT QUAN TRỌNG: Bọc ListView.builder bằng Expanded để nó
          // nhận phần chiều cao còn lại của màn hình bên trong Column
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              // Spacing cố định giữa các item
              padding: const EdgeInsets.only(bottom: 16),
              itemBuilder: (context, index) {
                final movie = movies[index];
                final String firstLetter = movie['title']![0];

                return Padding(
                  // Spacing nhất quán: ngang 16px, dọc 6px
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Card(
                    elevation: 1.5,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Leading Avatar
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: theme.colorScheme.primaryContainer,
                            child: Text(
                              firstLetter,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14), // Spacing ngang 14px

                          // Content thông tin phim
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie['title']!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  movie['desc']!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Row thông tin phụ: Điểm, thể loại, thời lượng
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${movie['rating']}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      '• ${movie['genre']}',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      '• ${movie['duration']}',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Trailing Action button
                          IconButton(
                            icon: const Icon(Icons.bookmark_border),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Đã lưu: ${movie['title']}'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
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
