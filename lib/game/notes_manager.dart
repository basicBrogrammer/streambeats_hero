import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:streambeats_hero/game/game.dart';
import 'package:streambeats_hero/game/note.dart';

class NotesManager extends Component with HasGameRef<StreambeatsHeroGame> {
  final double bpm;
  List<dynamic> beats;
  final Sprite sprite;
  final Vector2 startPosition;
  final Vector2 endPosition;

  final double obstacleHeight = 20;
  late final double _obstacleSpeed;
  double elapsedTime = 0;
  static final startSize = Vector2(60, 85);
  static final scaleFactor = 2.0;

  NotesManager(
      this.bpm, this.beats, this.startPosition, this.endPosition, this.sprite)
      : super() {
    _obstacleSpeed = startSize.y * (this.bpm / 60);
  }

  void _spawnNote() {
    final scale = ScaleEffect(
      scale: Vector2.all(scaleFactor),
      duration: 2,
    );
    final move = MoveEffect(
      path: [endPosition],
      duration: 3,
    );

    var obstacle = Note(
      sprite: sprite,
      position: startPosition,
      size: startSize,
    )
      ..add(CombinedEffect(
        effects: [scale, move],
      ))
      ..anchor = Anchor.center;

    gameRef.add(obstacle);
    beats.removeAt(0);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // if (elapsedTime.round().remainder(3) == 0) {
    //   print("time: $elapsedTime");
    // }
    elapsedTime += dt;
    double offset = gameRef.canvasSize.y / (obstacleHeight * _obstacleSpeed);
    if (beats.length > 0 && elapsedTime > beats.first - offset) {
      _spawnNote();
    }
  }
}
