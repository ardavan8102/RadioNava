import 'package:flutter/material.dart';

class CreateSectionTitle extends StatelessWidget {
  final List<dynamic> sections;
  final String targetId;
  final bool showButton;

  const CreateSectionTitle({
    super.key,
    required this.sections,
    required this.targetId,
    required this.showButton,
  });

  @override
  Widget build(BuildContext context) {

    final filteredSections = sections.where((s) {
      final typeValue = s.type?.toString().toLowerCase() ?? '';
      final idValue = s.id?.toString().toLowerCase() ?? '';
      return typeValue.contains('header') && idValue == targetId.toLowerCase();
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: filteredSections.map((section) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                section.title ?? "بدون عنوان",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              showButton
              ? TextButton(onPressed: () {}, child: Text('See All'))
              : Text(''),
            ],
          ),
        );
      }).toList(),
    );
  }
}
