import 'package:flutter/material.dart';

class ZFSlider extends StatefulWidget {
  final bool isFocus;
  final double width;
  final double height;
  final double value;
  final double min;
  final double max;
  final Function onChanged;

  const ZFSlider(
      {this.value = 0,
      this.min = 0,
      this.max = 1,
      this.onChanged,
      this.isFocus = false,
      this.width,
      this.height});
  @override
  State<StatefulWidget> createState() => ZFSliderState();
}

class ZFSliderState extends State<ZFSlider> {
  final double _sliderW = 10;
  final Color focusBorderColor = Color(0xFFA1A4AB);
  final Color focusSliderActiveColor = Colors.green;
  final Color focusSliderTrackColor = Color(0xFFA2A5AB);
  final Color focusThumbColor = Colors.white;

  final Color borderColor = Color(0xFF3C414B);
  final Color sliderActiveColor = Color(0xFF333C42);
  final Color sliderTrackColor = Color(0xFF3D444F);
  final Color thumbColor = Color(0xFF7E8492);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            color: widget.isFocus
                ? Color(0xFF2E3340)
                : Color(0xFF15171D),
            borderRadius: BorderRadius.all(Radius.circular(2)),
            border: Border.all(
                // width: 2,//为毛会影响里面slider的圆角？
                color:
                    widget.isFocus ? focusSliderTrackColor : sliderTrackColor)),
        child: Stack(children: <Widget>[
          Center(
            child: Container(
              // color: Colors.red,
              width: _sliderW * 0.5,
              height: widget.height - 2 * widget.width,
              decoration: BoxDecoration(
                  color:
                      widget.isFocus ? focusSliderTrackColor : sliderTrackColor,
                  borderRadius: BorderRadius.all(Radius.circular(_sliderW)),
                  border: Border.all(
                      color: widget.isFocus
                          ? focusSliderTrackColor
                          : sliderTrackColor)),
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: SliderTheme(
                data: SliderThemeData(
                    thumbColor: widget.isFocus ? focusThumbColor : thumbColor,
                    // thumbShape: RoundSliderThumbShape(enabledThumbRadius: widget.width * 0.5),
                    activeTrackColor: widget.isFocus
                        ? focusSliderActiveColor
                        : sliderActiveColor,
                    inactiveTrackColor: Colors.transparent,
                    trackHeight: _sliderW),
                child: Slider(
                  value: widget.value,
                  min: widget.min,
                  max: widget.max,
                  // activeColor: Colors.green,
                  // inactiveColor: Colors.green,
                  onChanged: widget.onChanged,
                )),
          )
        ]),
      ),
      height: widget.height,
      width: widget.width,
    );
  }
}
