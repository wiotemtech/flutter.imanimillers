import 'package:flutter/material.dart';
import '../../models/batch_model.dart';

class StatusBadge extends StatelessWidget {
  final BatchStatus status;
  final bool small;

  const StatusBadge({
    super.key,
    required this.status,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 8 : 12,
        vertical: small ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.displayName,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: small ? 10 : 12,
          color: status.color,
        ),
      ),
    );
  }
}