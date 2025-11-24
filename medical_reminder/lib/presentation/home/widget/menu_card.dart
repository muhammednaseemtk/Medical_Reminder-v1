import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;
  const MenuCard({super.key, required this.image, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
