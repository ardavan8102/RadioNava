import 'package:flutter/material.dart';
import 'package:radio_nava/models/data_model.dart';

class SliderRowFreshDrops extends StatelessWidget {
  final List<Section> sections;
  final String targetId;
  final int itemCount;

  const SliderRowFreshDrops({
    super.key,
    required this.sections,
    required this.targetId,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {

    final sliderSections = sections.where((s) {
      final typeValue = s.type.toString().toLowerCase();
      final idValue = s.id.toLowerCase();
      return typeValue.contains('slider_row') &&
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
              height: 340,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  final item = items[index];

                  // Null Safe
                  final String songName = item.song ?? '';
                  final String thumbnail = item.thumbnail;
                  final String songArtist = item.artist!;

                  // Song type
                  final songType = item.type;
                  String songTypeString;
                  switch (songType) {
                    case SubtypeEnum.MP3:
                      songTypeString = 'Song';
                      break;
                    case SubtypeEnum.VIDEO:
                      songTypeString = 'Video';
                      break;
                    case SubtypeEnum.PODCAST:
                      songTypeString = 'Podcast';
                      break;
                    default:
                      songTypeString = 'Unknown';
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Cover
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              thumbnail,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 70,
                                  height: 70,
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

                          const SizedBox(width: 12),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  songName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              SizedBox(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                              
                                    SizedBox(height: 8),
                              
                                    Row(
                                      children: [
                                        Text(
                                          songTypeString,
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.7)
                                          ),
                                        ),
                              
                                        SizedBox(width: 8),
                              
                                        Icon(
                                          Icons.circle,
                                          color: Colors.white.withValues(alpha: 0.7),
                                          size: 6,
                                        ),
                              
                                        SizedBox(width: 8),
                              
                                        Text(
                                          songArtist,
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.7)
                                          ),
                                        ),
                                      ],
                                    ),
                              
                                    
                                  ],
                                ),
                              ),
                            ],
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
