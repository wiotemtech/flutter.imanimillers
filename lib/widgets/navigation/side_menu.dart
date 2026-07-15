import 'package:flutter/material.dart';
import '../../core/colors.dart';

class SideMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SideMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Brand header with logo
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.border),
                ),
              ),
              child: Row(
                children: [
                  // Responsive logo in drawer
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/trial_logo.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback if logo image fails to load
                        return Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'IM',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Imani Grain Millers',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.primaryText,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Perfection in milling',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Navigation items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildNavItem(
                    icon: Icons.dashboard_rounded,
                    label: 'Dashboard',
                    index: 0,
                  ),
                  _buildNavItem(
                    icon: Icons.add_box_rounded,
                    label: 'Create Batch',
                    index: 1,
                  ),
                  _buildNavItem(
                    icon: Icons.person_add_rounded,
                    label: 'Register Client',
                    index: 2,
                  ),
                  _buildNavItem(
                    icon: Icons.settings_rounded,
                    label: 'Milling',
                    index: 3,
                  ),
                  _buildNavItem(
                    icon: Icons.payments_rounded,
                    label: 'Payments',
                    index: 4,
                  ),
                  _buildNavItem(
                    icon: Icons.request_quote_rounded,
                    label: 'Payouts',
                    index: 5,
                  ),
                  _buildNavItem(
                    icon: Icons.person_rounded,
                    label: 'Profile',
                    index: 6,
                  ),
                  const SizedBox(height: 8),
                  Divider(color: AppColors.border),
                  _buildNavItem(
                    icon: Icons.logout_rounded,
                    label: 'Logout',
                    index: 7,
                    isLogout: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    bool isLogout = false,
  }) {
    final isSelected = selectedIndex == index;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected 
            ? AppColors.highlight 
            : (isLogout ? Colors.red.shade400 : AppColors.primaryText.withValues(alpha: 0.6)),
        size: 22,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          color: isSelected 
              ? AppColors.highlight 
              : (isLogout ? Colors.red.shade400 : AppColors.primaryText),
          fontSize: 14,
        ),
      ),
      selected: isSelected,
      selectedTileColor: AppColors.highlight.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () => onItemSelected(index),
      trailing: isSelected
          ? Container(
              width: 3,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.highlight,
                borderRadius: BorderRadius.circular(2),
              ),
            )
          : null,
    );
  }
}