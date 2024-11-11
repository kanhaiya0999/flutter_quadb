import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onScreenSelected;
  final int selectedIndex;

  const CustomNavigationBar({
    super.key,
    required this.onScreenSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ],
      onDestinationSelected: (value) {
        onScreenSelected(value);
      },
    );
  }
}
