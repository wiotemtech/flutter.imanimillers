import 'package:flutter/material.dart';
import '../../core/colors.dart';

class SummaryCardsSection extends StatelessWidget {
  const SummaryCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive breakpoints
        final width = constraints.maxWidth;
        int crossAxisCount;
        if (width < 360) {
          crossAxisCount = 2;
        } else if (width < 480) {
          crossAxisCount = 2;
        } else if (width < 600) {
          crossAxisCount = 3;
        } else if (width < 900) {
          crossAxisCount = 4;
        } else {
          crossAxisCount = 4;
        }
        
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.8,
          children: const [
            _SummaryCard(
              title: 'Total Batches',
              value: '247',
              icon: Icons.inventory_rounded,
              color: AppColors.primary,
            ),
            _SummaryCard(
              title: 'Queued',
              value: '12',
              icon: Icons.pending_rounded,
              color: AppColors.queued,
            ),
            _SummaryCard(
              title: 'Processing',
              value: '8',
              icon: Icons.settings_rounded,
              color: AppColors.processing,
            ),
            _SummaryCard(
              title: 'Unpaid',
              value: 'UGX 3,450,000',
              icon: Icons.warning_rounded,
              color: AppColors.unpaid,
            ),
          ],
        );
      },
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.primaryText.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: AppColors.primaryText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}