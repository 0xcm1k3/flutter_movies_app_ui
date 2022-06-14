import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool showReadMore = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            widget.text,
            maxLines: (showReadMore) ? 4 : null,
            overflow: (showReadMore) ? TextOverflow.fade : null,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 14,
                  color: const Color(0xFFBCBCBC),
                ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (showReadMore) {
                showReadMore = false;
                return;
              }
              showReadMore = true;
            });
          },
          child: Text(
            (showReadMore) ? "READ MORE" : "SHOW LESS",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 14,
                  color: Colors.blue[200],
                  fontWeight: FontWeight.bold,
                ),
          ),
        )
      ],
    );
  }
}
