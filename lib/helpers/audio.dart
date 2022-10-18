import 'package:flame_audio/flame_audio.dart';

checkFoneMusic(foneMusic) {
  if (foneMusic == true) {
    FlameAudio.bgm.play('fonemusic.wav', volume: .2);
  } else {
    FlameAudio.bgm.stop();
  }
}

checkMusic(musicFile, foneMusic) {
  if (foneMusic == true) {
    FlameAudio.bgm.stop();
    FlameAudio.play(musicFile, volume: 10);
  } else {
    return;
  }
}

resumeMusic(foneMusic) {
  if (foneMusic == true) {
    FlameAudio.bgm.resume();
  }
}

loadMusic() async {
  await FlameAudio.audioCache.load('fonemusic.wav');
}

music() {}
