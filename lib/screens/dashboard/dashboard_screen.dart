import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../widgets/navigation/side_menu.dart';
import '../../widgets/dashboard/dashboard_header.dart';
import '../../widgets/dashboard/summary_cards_section.dart';
import '../../widgets/dashboard/recent_batches.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final String userName = 'Michael';
  final String userRole = 'Plant Manager';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pop(context);
          _showNavigationPlaceholder(index);
        },
      ),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
            iconSize: 28,
            color: AppColors.primaryText,
          ),
        ),
        title: null, // No title in AppBar
        centerTitle: false,
        toolbarHeight: 56,
        actions: const [], // Empty actions
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const DashboardHeader(
              userName: 'Michael',
              userRole: 'Plant Manager',
            ),
            const SizedBox(height: 20),
            const SummaryCardsSection(),
            const SizedBox(height: 24),
            const RecentBatches(),
            const SizedBox(height: 80), // Space for FAB
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showNavigationPlaceholder(0);
        },
        icon: const Icon(Icons.add_rounded, size: 20),
        label: const Text('Create Batch'),
        backgroundColor: AppColors.highlight,
        foregroundColor: AppColors.white,
      ),
    );
  }

  void _showNavigationPlaceholder(int index) {
    final items = [
      'Create Batch',
      'Register Client',
      'Milling',
      'Payments',
      'Payouts',
      'Profile',
      'Logout'
    ];
    
    if (index < items.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Navigating to ${items[index]}'),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}