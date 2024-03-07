import 'package:flutter/material.dart';
import 'model.dart';
import 'showx.dart';

class Notes extends StatelessWidget {
  Notes(this.n, this.ind, this.s, this.sx, this.sv, {Key? key})
      : super(key: key);

  note n;
  int ind;
  Function(note, int) s;
  Function(note) sx;
  Function(note) sv;
  void _handleTap(BuildContext context) async {
    var z = await Navigator.push<note>(
      context,
      MaterialPageRoute(builder: (ctx) => Shows(n, 1)),
    );
    if (z != null) {
      n = z;
      s(n, ind);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(n),
      background: Container(
        color: n.cx.withOpacity(0.3),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
            Icon(
              Icons.archive_rounded,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          sx(n);
        }
        if (direction == DismissDirection.startToEnd) {
          sv(n);
        }
      },
      child: InkWell(
        onTap: () => _handleTap(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Transform.rotate(
            angle: -0.09,
            child: Container(
              decoration: BoxDecoration(
                  color: n.cx.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Image.asset(
                    "pngegg.png",
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    n.headline.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: n.cx.withOpacity(0.9),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const Divider(
                    thickness: 0.09,
                    color: Colors.black,
                  ),
                  const Text(
                    "Tap to view",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
