import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final int currentProgress;
  final int maxProgress;
  final double width;
  final double height;
  final Color color;

  const ProgressBar({
    super.key,
    required this.currentProgress,
    required this.maxProgress,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {

  @override
  Widget build(BuildContext context) {
    int progress = widget.currentProgress;
    int maxProgress = widget.maxProgress;

    return Center(
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.white, // 전체 진행 바의 배경색
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: (progress / maxProgress) * widget.width, // 현재 진척도에 따라 너비를 조절
            decoration: BoxDecoration(
              color: widget.color, // 진행 중인 부분의 배경색
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
            ),
          ),
        ),
      ),
    );
  }
}