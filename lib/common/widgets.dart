import 'dart:math';
import 'dart:ui' as ui;

import 'package:carbon/gen/assets.gen.dart';
import 'package:carbon/gen/colors.gen.dart';
import 'package:carbon/translations/gen/l10n.dart';
import 'package:diffutil_dart/diffutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenTemplate extends StatelessWidget {
  const ScreenTemplate({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(), // avoid white glitch on top of the screen
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  child,
                  const Gap(92),
                ],
              ),
              const Logo(),
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 16,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Assets.logo.svg(
          height: 48,
        ),
      ),
    );
  }
}

class GreenHeader extends StatelessWidget {
  const GreenHeader();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 500),
      painter: _GreenHeaderCustomPainter(),
    );
  }
}

class _GreenHeaderCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(0, size.height * 0.68),
        Offset(size.width, 0),
        const [ColorName.darkGreen, ColorName.mediumGreen],
        [0.00, 1.00],
      );

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.6142857)
      ..quadraticBezierTo(size.width * 0.0194917, size.height * 0.6669, 50, size.height * 0.6714286)
      ..cubicTo(
        size.width * 0.3240167,
        size.height * 0.6588286,
        size.width * 0.6720333,
        size.height * 0.6296,
        size.width * 0.9166667,
        size.height * 0.6,
      )
      ..quadraticBezierTo(size.width * 0.9941333, size.height * 0.5920286, size.width, size.height * 0.5285714)
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width * 0.75, 0, 0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GreenHeaderItem extends StatelessWidget {
  const GreenHeaderItem({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: ColorName.lightGreen,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 200,
        child: Tap(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: child,
          ),
        ),
      ),
    );
  }
}

class WhiteHeader extends StatelessWidget {
  const WhiteHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi,
      child: CustomPaint(
        size: const Size(double.infinity, 500),
        painter: _WhiteHeaderCustomPainter(),
      ),
    );
  }
}

class _WhiteHeaderCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.6142857)
      ..quadraticBezierTo(size.width * 0.0194917, size.height * 0.6669, 50, size.height * 0.6714286)
      ..cubicTo(
        size.width * 0.3240167,
        size.height * 0.6588286,
        size.width * 0.6720333,
        size.height * 0.6296,
        size.width * 0.9166667,
        size.height * 0.6,
      )
      ..quadraticBezierTo(size.width * 0.9941333, size.height * 0.5920286, size.width, size.height * 0.5285714)
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width * 0.75, 0, 0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.onTap,
    this.iconColor = Colors.white,
  }) : super(key: key);

  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(10),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Tap(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: DottedBorder(
            padding: const EdgeInsets.all(4),
            color: Colors.green[100]!,
            borderType: BorderType.RRect,
            dashPattern: const [8],
            strokeWidth: 3,
            radius: const Radius.circular(12),
            child: SizedBox(
              width: 200,
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 64,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AutoAnimList extends StatefulWidget {
  const AutoAnimList({
    Key? key,
    required this.children,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
  }) : super(key: key);

  final List<Widget> children;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;

  @override
  _AutoAnimListState createState() => _AutoAnimListState();
}

class _AutoAnimListState extends State<AutoAnimList> {
  final _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: widget.children.length,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: widget.controller,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      itemBuilder: (BuildContext context, int index, Animation<double> animation) {
        return _fadeItem(context, widget.children[index], animation);
      },
    );
  }

  @override
  void didUpdateWidget(covariant AutoAnimList oldWidget) {
    super.didUpdateWidget(oldWidget);

    final diffResult = calculateListDiff<Key?>(
      oldWidget.children.map((w) => w.key).toList(),
      widget.children.map((w) => w.key).toList(),
      detectMoves: false,
    );

    for (final update in diffResult.getUpdates(batch: false)) {
      update.when(
        insert: (pos, count) {
          for (int i = pos; i <= pos + count - 1; i++) {
            _listKey.currentState?.insertItem(i);
          }
        },
        remove: (pos, count) {
          for (int i = count - 1; i >= 0; i--) {
            _listKey.currentState
                ?.removeItem(pos + i, (_, animation) => _fadeItem(context, oldWidget.children[pos + i], animation));
          }
        },
        change: (pos, payload) => throw UnsupportedError,
        move: (from, to) => throw UnsupportedError,
      );
    }
  }

  Widget _fadeItem(BuildContext context, Widget item, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: item,
    );
  }
}

class Tap extends StatelessWidget {
  const Tap({
    Key? key,
    this.child,
    this.onTap,
    this.customBorder,
    this.borderRadius,
  }) : super(key: key);

  final Widget? child;
  final GestureTapCallback? onTap;
  final ShapeBorder? customBorder;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    // Material needed for the InkWell to display correctly
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: customBorder,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}

class SimpleMenuButton extends StatelessWidget {
  const SimpleMenuButton({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<SimpleMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (id) {
        items.firstWhere((c) => c.text == id).onTap();
      },
      itemBuilder: (BuildContext context) => items.map((item) => item.build(context)).toList(),
    );
  }
}

class SimpleMenuItem {
  const SimpleMenuItem({
    required this.text,
    this.icon,
    this.iconColor = ColorName.mediumGreen,
    required this.onTap,
  });

  final String text;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback onTap;

  PopupMenuItem<String> build(BuildContext context) {
    return PopupMenuItem<String>(
      value: text,
      child: Row(
        children: [
          if (icon != null) Icon(icon, color: iconColor),
          if (icon != null) const Gap(8),
          Text(text),
        ],
      ),
    );
  }
}

class DialogColumn extends StatelessWidget {
  const DialogColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 400, maxWidth: 400),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
    );
  }
}

class AutoLinkMarkdown extends StatelessWidget {
  const AutoLinkMarkdown({
    Key? key,
    required this.data,
    this.defaultTextColor,
  }) : super(key: key);

  final String data;
  final Color? defaultTextColor;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: data,
      styleSheet: MarkdownStyleSheet(
        p: TextStyle(color: defaultTextColor ?? Colors.grey[600], height: 1.8),
        blockSpacing: 14,
      ),
      onTapLink: (text, href, title) {
        launch(href!);
      },
    );
  }
}

class ScopeDot extends StatelessWidget {
  const ScopeDot({
    Key? key,
    required this.scopeIdx,
    this.isDark = false,
  }) : super(key: key);

  final int scopeIdx;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: scopeIdx == 0
            ? isDark
                ? ColorName.scope1DarkColor
                : ColorName.scope1Color
            : scopeIdx == 1
                ? isDark
                    ? ColorName.scope2DarkColor
                    : ColorName.scope2Color
                : isDark
                    ? ColorName.scope3DarkColor
                    : ColorName.scope3Color,
      ),
    );
  }
}

Future showValidationDialog(BuildContext context, VoidCallback onValidation) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        actionsPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        title: Text(Translation.current.validationDialogTitle),
        actions: [
          const CancelButton(),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onValidation();
            },
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
          ),
        ],
      );
    },
  );
}
