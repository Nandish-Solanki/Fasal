import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final double textSize;
  final double titleSize;
  final String? title;
  final Offset startOffset;
  final Offset endOffset;
  final Offset finalOffset;

  AnimatedText({ 
    required this.text,
    required this.textSize,
    required this.titleSize,
    this.title,
    required this.startOffset,
    required this.endOffset,
    required this.finalOffset,
  });

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: widget.startOffset,
      end: widget.endOffset,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final isCompleted = _controller.isCompleted;
        final offset = isCompleted ? widget.finalOffset : _offsetAnimation.value;

        // Determine text alignment based on finalOffset
        TextAlign textAlign;
        if (offset.dx < 0) {
          textAlign = TextAlign.left;
        } else if (offset.dx > 0) {
          textAlign = TextAlign.right;
        } else {
          textAlign = TextAlign.center;
        }

        return SlideTransition(
          position: Tween<Offset>(
            begin: widget.startOffset,
            end: offset,
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.easeInOut,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment(
                offset.dx, 
                0.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null)
                    Text(
                      widget.title!,
                      textAlign: textAlign,
                      style: TextStyle(
                        fontSize: widget.titleSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  const SizedBox(height: 5),
                  Text(
                    widget.text,
                    textAlign: textAlign,
                    style: TextStyle(
                      fontSize: widget.textSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
