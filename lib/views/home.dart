import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radio_nava/models/data_model.dart';
import 'package:radio_nava/widgets/home/create_section.dart';
import 'package:radio_nava/widgets/slider_row/slider_row_fresh_drops.dart';
import 'package:radio_nava/widgets/slider_square/slider_square.dart';
import 'package:radio_nava/widgets/slider_square/slider_square_djmix.dart';
import 'package:radio_nava/widgets/slider_square/slider_square_hot_tracks.dart';
import 'package:radio_nava/widgets/slider_square/slider_square_more_music.dart';
import 'package:radio_nava/widgets/slider_square/slider_square_mp3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Section> sections = [];

  @override
  void initState() {
    super.initState();
    _loadTracks();
  }

  Future<void> _loadTracks() async {
    final data = await rootBundle.loadString('assets/audio/data.json');
    final jsonResult = jsonRenderModelFromJson(data);

    if (!mounted) return;
    setState(() {
      sections = jsonResult.sections;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SvgPicture.asset(
          'assets/svg/RADIONAVA.svg',
          height: 30,
          width: 30,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: sections.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // Section : Vibes
                    CreateSectionTitle(
                      sections: sections,
                      targetId: 'playlists_header',
                      showButton: false,
                    ),

                    SectionSliderSquare(
                      sections: sections, 
                      targetId: 'playlists',
                      targetType: 'playlist',
                    ),

                    // Section : Top Artists
                    CreateSectionTitle(sections: sections, targetId: 'top_artists_header', showButton: false),
                    SectionSliderSquare(sections: sections, targetId: 'top_artists_header', targetType: 'artist'),

                    // Section : Best Release
                    CreateSectionTitle(sections: sections, targetId: 'home_newreleases_header', showButton: false),
                    SliderSquareMp3(sections: sections, targetId: 'home_newreleases'),

                    // Section : Hot Tracks
                    CreateSectionTitle(sections: sections, targetId: 'mp3s_header', showButton: false),
                    SliderSquareHotTracks(sections: sections, targetId: 'mp3s_hottracks'),

                    // Section : Fresh Drops
                    CreateSectionTitle(sections: sections, targetId: 'home_drops_header', showButton: false),
                    SliderRowFreshDrops(sections: sections, targetId: 'home_drops', itemCount: 4),

                    // Section: Today's New tracks
                    CreateSectionTitle(sections: sections, targetId: 'new_playlists_header', showButton: false),
                    SectionSliderSquare(sections: sections, targetId: 'new_playlists', targetType: 'playlist'),

                    // Section: Dj Mix
                    CreateSectionTitle(sections: sections, targetId: 'home_djmixes_header', showButton: false),
                    SliderSquareDjmix(sections: sections, targetId: 'home_djmixes'),


                    // Section : More Music
                    CreateSectionTitle(sections: sections, targetId: 'home_music_header', showButton: false),
                    SliderSquareMoreMusic(sections: sections, targetId: 'home_music'),
                  ],
                ),
              ),
      ),
    );
  }
}
