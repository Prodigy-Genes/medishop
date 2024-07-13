import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  final VoidCallback onMedicationPressed;
  final VoidCallback onMyOrdersPressed;
  final VoidCallback onSupportChatPressed;

  const CardRow({
    super.key,
    required this.onMedicationPressed,
    required this.onMyOrdersPressed,
    required this.onSupportChatPressed,
  });

  @override
  Widget build(BuildContext context) {
    const Color color = Color.fromRGBO(0, 102, 255, 1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCard(
          iconPath: 'assets/icons/medication.png',
          text: 'Medication',
          onPressed: onMedicationPressed,
          color: color,
        ),
        _buildCard(
          iconPath: 'assets/icons/myorder.png',
          text: 'My Orders',
          onPressed: onMyOrdersPressed,
          color: color,
        ),
        _buildCard(
          iconPath: 'assets/icons/chat.png',
          text: 'Support Chat',
          onPressed: onSupportChatPressed,
          color: color,
        ),
      ],
    );
  }

  Widget _buildCard({
    required String iconPath,
    required String text,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 112,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              height: 20,
              width: 20,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
