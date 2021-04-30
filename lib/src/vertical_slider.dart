import 'package:flutter/material.dart';

typedef VerticalSliderCallback(double);

/// A vertical slider widget.
class VerticalSlider extends StatefulWidget {
  /// Width of the slider.
  final double width;

  /// Height of the slider.
  final double height;

  /// The foreground color.
  final Color foregroundColor;

  /// The background color.
  final Color backgroundColor;

  /// The value. 0 to 1.
  final double value;

  /// The duration of the animation.
  final Duration animationDuration;

  /// The curve of the animation.
  final Curve curve;

  /// Would be called when the value is changed.
  final VerticalSliderCallback onValueChanged;

  VerticalSlider({
    Key key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.foregroundColor,
    this.backgroundColor,
    this.value = 1.0,
    this.onValueChanged,
    this.animationDuration,
    this.curve,
  }) : super(key: key);

  @override
  _VerticalSliderState createState() => _VerticalSliderState();
}

class _VerticalSliderState extends State<VerticalSlider>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _value;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: widget.animationDuration ?? Duration(milliseconds: 250));
    _value = widget.value;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VerticalSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    double _computeValue(BoxConstraints layout, Offset localPosition) =>
        1 - (localPosition.dy / layout.maxHeight);

    final backgroundColor =
        widget.backgroundColor ?? Theme.of(context).canvasColor;
    final foregroundColor =
        widget.foregroundColor ?? Theme.of(context).primaryColor;

    _controller.animateTo(_value, curve: widget.curve ?? Curves.linear);

    return Container(
        width: widget.width,
        height: widget.height,
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.elliptical(20, 16)),
            child: LayoutBuilder(builder: (context, layout) {
              return GestureDetector(
                  onVerticalDragStart: (details) => setState(() =>
                      _value = _computeValue(layout, details.localPosition)),
                  onVerticalDragUpdate: (details) => setState(() =>
                      _value = _computeValue(layout, details.localPosition)),
                  onVerticalDragEnd: (details) {
                    if (widget.onValueChanged != null)
                      widget.onValueChanged(_value);
                  },
                  child: Stack(children: [
                    Container(color: backgroundColor),
                    Align(
                        alignment: Alignment(0, 1),
                        child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) => Container(
                                height: layout.maxHeight * _controller.value,
                                color: foregroundColor)))
                  ]));
            })));
  }
}
