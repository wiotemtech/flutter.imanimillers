import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../models/batch_model.dart';
import '../shared/status_badge.dart';

class RecentBatches extends StatelessWidget {
  const RecentBatches({super.key});

  @override
  Widget build(BuildContext context) {
    final batches = BatchModel.getSampleData();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Batches',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 12),
        ...batches.map((batch) => _BatchCard(batch: batch)),
      ],
    );
  }
}

class _BatchCard extends StatelessWidget {
  final BatchModel batch;

  const _BatchCard({required this.batch});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Batch Number + Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  batch.batchNumber,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppColors.primaryText,
                  ),
                ),
                StatusBadge(status: batch.status),
              ],
            ),
            const SizedBox(height: 6),
            // Row 2: Client + Grain
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Client: ${batch.client}',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.primaryText.withValues(alpha: 0.8),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    batch.grain,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Row 3: Date + Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  batch.formattedDate,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryText.withValues(alpha: 0.5),
                  ),
                ),
                Text(
                  batch.formattedAmount,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}