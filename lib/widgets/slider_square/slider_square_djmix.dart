import 'package:flutter/material.dart';
import 'package:radio_nava/models/data_model.dart';

class SliderSquareDjmix extends StatelessWidget {
  final List<Section> sections;
  final String targetId;


  const SliderSquareDjmix({
    super.key,
    required this.sections,
    required this.targetId,
  });

  @override
  Widget build(BuildContext context) {


    final sliderSections = sections.where((s) {
      final typeValue = s.type.toString().toLowerCase();
      final idValue = s.id.toLowerCase();
      return typeValue.contains('slider_square') &&
          idValue == targetId.toLowerCase();
    }).toList();

    if (sliderSections.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sliderSections.map((section) {
        final items = section.items ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  // Null Safe
                  final String title = item.title!;
                  final String thumbnail = item.thumbnail;
                  final String subtitle = item.subtitle!;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Cover
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              thumbnail,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.grey[800],
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.music_note,
                                    color: Colors.white54,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Title
                          SizedBox(
                            width: 150,
                            child: Text(
                              subtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          // Desc
                          Flexible(
                            child: SizedBox(
                              width: 150,
                              child: Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha : 0.7),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
