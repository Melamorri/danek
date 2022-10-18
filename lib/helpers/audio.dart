import 'package:flame_audio/flame_audio.dart';

checkFoneMusic(foneMusic) {
  if (foneMusic == true) {
    FlameAudio.bgm.play('fonemusic.wav', volume: .2);
  } else {
    FlameAudio.bgm.dispose();
  }
}

checkMusic(musicFile, foneMusic) {
  if (foneMusic == true) {
    FlameAudio.play(musicFile, volume: 10);
  } else {
    return;
  }
}
