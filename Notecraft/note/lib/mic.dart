import 'package:flutter/material.dart';

class mic extends StatefulWidget {
  mic(this.v, {super.key});
  Color v;
  @override
  ShowsState createState() => ShowsState();
}

class ShowsState extends State<mic> with TickerProviderStateMixin {
  late AnimationController ax;
  late Animation<double> xy;
  bool b = false;
  @override
  void initState() {
    super.initState();
    ax = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..repeat(reverse: true);
    xy = Tween(begin: 0.0, end: 15.0)
        .animate(CurvedAnimation(parent: ax, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    if (b == false) {
      ax.stop();
    }
    return Center(
      child: AnimatedBuilder(
          animation: ax,
          builder: (ctx, child) {
            return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: widget.v.withOpacity(0.6),
                    spreadRadius: ax.value * 12,
                    blurRadius: ax.value + 6,
                  )
                ], borderRadius: BorderRadius.circular(30), color: widget.v),
                child: IconButton(
                  onPressed: () {
                    if (b) {
                      ax.stop();
                      ax.reset();
                    } else {
                      ax.repeat(reverse: true);
                    }
                    setState(() {
                      b = !b;
                    });
                  },
                  icon: Icon(
                    b == true ? Icons.mic : Icons.mic_off,
                    color: Colors.white,
                    size: 40,
                  ),
                ));
          }),
    );
  }
}
