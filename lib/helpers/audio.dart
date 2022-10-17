import 'package:flame_audio/bgm.dart';
import 'package:flame_audio/flame_audio.dart';

checkMusic(foneticMusic) async {
  if (foneticMusic) {
    FlameAudio.audioCache.load('fonemusic.wav');
    // await FlameAudio.playLongAudio('fonemusic.wav');
  } else {
    // late final Bgm bgm = Bgm(audioCache: );

    await FlameAudio.bgm.stop();
  }
}
