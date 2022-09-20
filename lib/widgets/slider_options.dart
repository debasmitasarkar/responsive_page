import 'package:flutter/material.dart';

class SliderOptions extends StatefulWidget {
  final Function(int) onPressed;
  const SliderOptions({
    super.key,
    required this.onPressed,
  });

  @override
  State<SliderOptions> createState() => _SliderOptionsState();
}

class _SliderOptionsState extends State<SliderOptions> {
  int focused = 0;
  ScrollController controller = ScrollController();

  void onTap(int index) {
    widget.onPressed(index);
    setState(() {
      focused = index;
    });
    if (index == 0) {
      controller.jumpTo(0);
    } else if (index == 2) {
      controller.jumpTo(controller.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Center(
        child: SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => onTap(0),
                  child: OptionWidget(
                    isFocused: focused == 0,
                    text: 'Arbeitnehmer',
                  ),
                ),
                InkWell(
                  onTap: () => onTap(1),
                  child: OptionWidget(
                    isFocused: focused == 1,
                    text: 'Arbeitgeber',
                  ),
                ),
                InkWell(
                  onTap: () => onTap(2),
                  child: OptionWidget(
                    isFocused: focused == 2,
                    text: 'Temporärbüro',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String text;
  final bool isFocused;

  const OptionWidget({
    super.key,
    required this.text,
    required this.isFocused,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 160,
      alignment: FractionalOffset.center,
      color: isFocused ? const Color(0XFF81E6D9) : Colors.white,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isFocused ? Colors.white : const Color(0XFF319795)),
      ),
    );
  }
}
