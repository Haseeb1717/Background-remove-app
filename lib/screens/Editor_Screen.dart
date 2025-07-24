import 'package:flutter/material.dart';
import 'package:BGRemove/screens/Home_screen.dart'; 
import 'package:BGRemove/screens/Account_screen.dart'; 

class EditorScreen extends StatelessWidget {
  final Color bgColor = Colors.black;
  final String imageUrl =
      'https://static.fotor.com/app/features/img/bgremove-banner-v2-t.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  Row(
                    children: const [
                      Icon(Icons.undo, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.redo, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.share, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),

            // Fullscreen Image
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),

            // Editor Options
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //in this part I need a swap functionilty so use can swap to see more feature of this editor
                children: const [
                  EditorOption(icon: Icons.wb_sunny, label: 'Exposure'),
                  EditorOption(icon: Icons.tonality, label: 'Contrast'),
                  EditorOption(icon: Icons.palette, label: 'Saturation'),
                  EditorOption(icon: Icons.blur_on, label: 'Sharpen'),
                  EditorOption(icon: Icons.brightness_3, label: 'Shadows'),
                ],
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        parentContext: context,
      ),
    );
  }
}

class EditorOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const EditorOption({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final BuildContext parentContext;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home_filled,
      Icons.edit,
      Icons.account_circle,
    ];

    final labels = ["Home", "Editor", "Account"];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10, offset: const Offset(0, -3)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              if (index == selectedIndex) return;

              if (index == 0) {
                Navigator.pushReplacement(
                  parentContext,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              } else if (index == 2) {
                Navigator.pushReplacement(
                  parentContext,
                  MaterialPageRoute(builder: (_) => AccountScreen()),
                );
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blueAccent.withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    icons[index],
                    color: isSelected ? Colors.blueAccent : Colors.white70,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 400),
                    child: Text(
                      isSelected ? labels[index] : "",
                      style: TextStyle(
                        color: isSelected ? Colors.blueAccent : Colors.transparent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
