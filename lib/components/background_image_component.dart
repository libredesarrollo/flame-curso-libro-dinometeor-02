import 'package:flame/components.dart';
import 'package:flame/events.dart';

class BackgroundImageComponent extends SpriteComponent
    with DragCallbacks, HasGameRef {
  late double screenWidth, screenHeight;

  @override
  Future<void>? onLoad() async {
    screenWidth = gameRef.size.x;
    screenHeight = gameRef.size.y;

    position = Vector2(0, 0);

    sprite = await Sprite.load('background.jpg');

    //size = Vector2(screenWidth, screenHeight);
    size = sprite!.originalSize;

    return super.onLoad();
  }

  @override
  void onDragStart(DragStartEvent event) {
    // print('canvasPosition--' + event.canvasPosition.toString());
    // print('devicePosition--' + event.devicePosition.toString());
    // print('localPosition--' + event.localPosition.toString());
    // print('parentPosition--' + event.parentPosition.toString());
    super.onDragStart(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    // print('canvasPosition--' + event.canvasPosition.toString());
    // print('devicePosition--' + event.devicePosition.toString());
    // print('localPosition--' + event.localPosition.toString());
    // print('parentPosition--' + event.parentPosition.toString());
    // print('event--' + event.delta.toString());

    final camera = gameRef.firstChild<CameraComponent>()!;
    camera.moveBy(event.localDelta / camera.viewfinder.zoom);
    super.onDragUpdate(event);
  }
}
