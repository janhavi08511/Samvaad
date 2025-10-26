import 'package:flutter/material.dart';
import 'package:samvaad/utils/app_colors.dart';

class AIReflectionsScreen extends StatefulWidget {
  static const String routeName = '/ai-reflections';
  const AIReflectionsScreen({super.key});

  @override
  State<AIReflectionsScreen> createState() => _AIReflectionsScreenState();
}

class _AIReflectionsScreenState extends State<AIReflectionsScreen> {
  String _selectedTab = 'Growth Mindset';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Reflections'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Tab Selector
            _buildTabSelector(),
            const SizedBox(height: 20.0),

            // Weekly Insights Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.auto_fix_high, color: AppColors.primary),
                        SizedBox(width: 8.0),
                        Text('Your Week\'s Insights', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'You\'ve shown remarkable resilience this week. Your journal entries reveal a pattern of positive coping strategies, especially when dealing with work stress.',
                      style: const TextStyle(fontSize: 15.0, height: 1.4),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Patterns Detected
            const Text(
              'Patterns Detected',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.darkText,
              ),
            ),
            const SizedBox(height: 16.0),
            _buildStatCard('Positive Mood Days', 0.65, AppColors.happy),
            _buildStatCard('Self-Care Activities', 0.80, AppColors.calm),
            const SizedBox(height: 30.0),

            // Recommended Topics
            const Text(
              'Recommended Topics',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.darkText,
              ),
            ),
            const SizedBox(height: 16.0),
            _buildTopicTile('Stress Management Techniques', Icons.trending_up),
            _buildTopicTile('Building Healthy Habits', Icons.psychology_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildTabPill('Growth Mindset'),
        const SizedBox(width: 12.0),
        _buildTabPill('Self-Care'),
      ],
    );
  }

  Widget _buildTabPill(String title) {
    bool isSelected = _selectedTab == title;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedTab = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent.withOpacity(0.3) : AppColors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.lightGrey,
            width: 1,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppColors.primary : AppColors.darkText,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16.0)),
          Text(
            '${(progress * 100).toInt()}%',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicTile(String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(icon, color: AppColors.darkText),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16.0, color: AppColors.greyText),
        onTap: () {
          // Navigate to topic detail
        },
      ),
    );
  }
}
