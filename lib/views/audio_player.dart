import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_nava/models/data_model.dart';

// Custom page route for dropdown effect
class VerticalSlideRoute extends PageRouteBuilder {
  final Widget page;

  VerticalSlideRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 400),
        );
}

class AudioPlayerPage extends StatefulWidget {
  final ItemElement item;
  final String songUrl;
  
  const AudioPlayerPage({super.key, required this.songUrl, required this.item});

  // Static method for navigation with dropdown effect
  static void navigateWithDropdown(BuildContext context, {required String songUrl, required ItemElement item}) {
    Navigator.push(
      context,
      VerticalSlideRoute(
        page: AudioPlayerPage(songUrl: songUrl, item: item),
      ),
    );
  }

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> with SingleTickerProviderStateMixin {

  final _player = AudioPlayer();
  late ItemElement item;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState(){
    super.initState();
    item = widget.item;
    
    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start entrance animation
    _animationController.forward();
    
    WidgetsFlutterBinding.ensureInitialized();
    _setupAudioPlayer();
  }

  Future<void> _closeWithAnimation() async {
    // Reverse animation first, then pop
    await _animationController.reverse();
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(item.thumbnail),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                children: [
                  // Header with close button
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            icon: Icon(
                              CupertinoIcons.chevron_down,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: _closeWithAnimation,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Song info
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          item.title!, // Assuming your ItemElement has title
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.artist ?? 'Unknown Artist', // Assuming your ItemElement has artist
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Progress bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _progressBar(),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Playback controls
                  _playbackControlButton(),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _setupAudioPlayer() async {
    _player.playbackEventStream.listen((event) {}, onError: (Object e, StackTrace stacktrace) {
      if (kDebugMode) {
        print('Stream Error : $e');
      }
    });

    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(widget.songUrl)));
    } catch (e) {
      if (kDebugMode) {
        print('Stream Error : $e');
      }
    }
  }

  Widget _playbackControlButton() {
    return StreamBuilder<PlayerState>(
      stream: _player.playerStateStream, 
      builder: (context, snapshot) {
        final processingState = snapshot.data?.processingState;
        final playing = snapshot.data?.playing;
        
        if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
          return Container(
            margin: const EdgeInsets.all(8),
            width: 64,
            height: 64,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        } else if (playing != true) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: IconButton(
              onPressed: _player.play,
              iconSize: 64,
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.black,
              ),
            ),
          );
        } else if (processingState != ProcessingState.completed) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: IconButton(
              onPressed: _player.pause,
              iconSize: 64,
              icon: const Icon(
                Icons.pause,
                color: Colors.black,
              ),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: IconButton(
              onPressed: () => _player.seek(Duration.zero),
              iconSize: 64,
              icon: const Icon(
                Icons.replay,
                color: Colors.black,
              ),
            ),
          );
        }
      }
    );
  }

  Widget _progressBar() {
    return StreamBuilder<Duration>(
      stream: _player.positionStream, 
      builder: (context, snapshot) {
        return ProgressBar(
          progress: snapshot.data ?? Duration.zero, 
          total: _player.duration ?? const Duration(seconds: 0),
          buffered: _player.bufferedPosition,
          progressBarColor: Colors.white,
          baseBarColor: Colors.grey[600],
          bufferedBarColor: Colors.grey[400],
          thumbColor: Colors.white,
          barHeight: 3,
          thumbRadius: 8,
          onSeek: (duration) {
            _player.seek(duration);
          },
        );
      }
    );
  }
}