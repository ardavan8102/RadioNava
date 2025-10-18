import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radio_nava/models/data_model.dart';
import 'package:radio_nava/widgets/home/create_section.dart';
import 'package:radio_nava/widgets/home/slider_square.dart';

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
        title: const Text(
          'Radio Nava',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
                  ],
                ),
              ),
      ),
    );
  }
}
