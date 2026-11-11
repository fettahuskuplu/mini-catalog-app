import 'package:flutter/material.dart';

class SpecBox extends StatelessWidget {
  final String label;
  final String value;

  const SpecBox({
    super.key,
    required this.label,
    required this.value,
  });

  String _formatLabel(String raw) {
    switch (raw.toLowerCase()) {
      case 'chip':
        return 'İşlemci';
      case 'material':
        return 'Gövde';
      case 'camera':
        return 'Kamera';
      case 'display':
        return 'Ekran';
      case 'battery':
        return 'Pil';
      case 'storage':
        return 'Hafıza';
      case 'audio':
        return 'Ses';
      case 'sensors':
        return 'Sensör';
      default:
        return raw.toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _formatLabel(label),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }
}
