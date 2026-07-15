import 'package:flutter/material.dart';
import '../core/colors.dart';

enum BatchStatus {
  queued,
  processing,
  completed,
  unpaid,
}

extension BatchStatusExtension on BatchStatus {
  String get displayName {
    switch (this) {
      case BatchStatus.queued:
        return 'Queued';
      case BatchStatus.processing:
        return 'Processing';
      case BatchStatus.completed:
        return 'Completed';
      case BatchStatus.unpaid:
        return 'Unpaid';
    }
  }
  
  Color get color {
    switch (this) {
      case BatchStatus.queued:
        return AppColors.queued;
      case BatchStatus.processing:
        return AppColors.processing;
      case BatchStatus.completed:
        return AppColors.completed;
      case BatchStatus.unpaid:
        return AppColors.unpaid;
    }
  }
}

class BatchModel {
  final String batchNumber;
  final String client;
  final String grain;
  final BatchStatus status;
  final DateTime createdDate;
  final double amount;

  BatchModel({
    required this.batchNumber,
    required this.client,
    required this.grain,
    required this.status,
    required this.createdDate,
    required this.amount,
  });

  String get formattedAmount => 'UGX ${amount.toStringAsFixed(0).replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]},',
  )}';

  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(createdDate);
    
    if (difference.inDays == 0) return 'Today';
    if (difference.inDays == 1) return 'Yesterday';
    if (difference.inDays < 7) return '${difference.inDays}d ago';
    return '${createdDate.day}/${createdDate.month}/${createdDate.year}';
  }

  static List<BatchModel> getSampleData() {
    return [
      BatchModel(
        batchNumber: 'B-2026-001',
        client: 'Grace Okafor',
        grain: 'Maize',
        status: BatchStatus.completed,
        createdDate: DateTime.now().subtract(const Duration(days: 1)),
        amount: 1250000,
      ),
      BatchModel(
        batchNumber: 'B-2026-002',
        client: 'Emeka Nwosu',
        grain: 'Sorghum',
        status: BatchStatus.processing,
        createdDate: DateTime.now().subtract(const Duration(hours: 6)),
        amount: 820000,
      ),
      BatchModel(
        batchNumber: 'B-2026-003',
        client: 'Amina Bello',
        grain: 'Millet',
        status: BatchStatus.queued,
        createdDate: DateTime.now().subtract(const Duration(hours: 12)),
        amount: 580000,
      ),
      BatchModel(
        batchNumber: 'B-2026-004',
        client: 'Chidi Okonkwo',
        grain: 'Maize',
        status: BatchStatus.unpaid,
        createdDate: DateTime.now().subtract(const Duration(days: 3)),
        amount: 1530000,
      ),
    ];
  }
}