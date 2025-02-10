import 'package:flutter/material.dart';

class FadeScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class FadeInScrollItem extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offset;

  const FadeInScrollItem({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.offset = 50.0,
  }) : super(key: key);

  @override
  State<FadeInScrollItem> createState() => _FadeInScrollItemState();
}

class _FadeInScrollItemState extends State<FadeInScrollItem> {
  bool _visible = false;
  bool _slideComplete = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _visible = true;
          _slideComplete = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: widget.duration,
      curve: Curves.easeInOut,
      child: AnimatedContainer(
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}
