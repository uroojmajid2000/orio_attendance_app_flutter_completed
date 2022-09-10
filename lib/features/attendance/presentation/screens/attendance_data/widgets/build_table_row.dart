import 'package:flutter/material.dart';

TableRow buildTableRow({date, day, checkin, checkout, hours, type}) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Text(
                date.substring(8, 10),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                day,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: checkin != null
              ? Text(
                  checkin,
                  style: TextStyle(
                      color: type == 'Late'
                          ? const Color(0xFFE9010A)
                          : const Color(0xFF0047BA)),
                )
              : const Text(''),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: checkout != null ? Text(checkout) : const Text(''),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: hours != null ? Text(hours) : const Text(''),
        ),
      ),
    ],
  );
}
