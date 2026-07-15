import 'package:flutter/material.dart';
import '../../core/colors.dart';

class DashboardHeader extends StatelessWidget {
  final String userName;
  final String userRole;

  const DashboardHeader({
    super.key,
    required this.userName,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Branding Section (Centered)
          Column(
            children: [
              // Logo
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/trial_logo.png',
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          'IM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              
              // Company Name
              Text(
                'Imani Grain Millers',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.primary,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              
              // Slogan
              Text(
                'Perfection in milling',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.highlight,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              
              // System Name
              Text(
                'Community Mill Management System',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.primaryText.withValues(alpha: 0.6),
                  letterSpacing: 0.2,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Divider
          Container(
            height: 1,
            color: AppColors.border,
          ),
          
          const SizedBox(height: 16),
          
          // Welcome Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome text
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome back,',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.primaryText.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(width: 16),
              
              // Role Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.border,
                    width: 1,
                  ),
                ),
                child: Text(
                  userRole,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}