//实现一个空白页面
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GalleryPageState();
  }
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leading: IconButton(
            iconSize: 36,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left)),
        toolbarHeight: 80,
        title: const Row(
          children: [
            SizedBox(width: 20),
            Expanded(
                child: Center(
                    child: Text(
                      'Gallery',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ))),
          ],
        ),
      ),
      body: const Center(child: DynamicGradientText('this is a text'),),
    );
  }
}

class DynamicGradientText extends StatefulWidget {
  final String text;

  const DynamicGradientText(this.text, {super.key});

  @override
  State<DynamicGradientText> createState() => _DynamicGradientTextState();
}

class _DynamicGradientTextState extends State<DynamicGradientText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: const [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                _animation.value - 0.9,
                _animation.value - 0.8,
                _animation.value - 0.7,
                _animation.value - 0.6,
                _animation.value - 0.5,
                _animation.value - 0.4,
                _animation.value - 0.3,
                _animation.value - 0.2,
                _animation.value - 0.1,
                _animation.value - 0,
              ],
            ).createShader(bounds);
          },
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}