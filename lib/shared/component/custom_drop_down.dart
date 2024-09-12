import 'dart:math' as math;

import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';

class CustDropDown<T> extends StatefulWidget {
  final List<CustDropdownMenuItem> items;
  final Function onChanged;
  final String hintText;
  final double borderRadius;
  final double maxListHeight;
  final double borderWidth;
  final int defaultSelectedIndex;
  final bool enabled;

  const CustDropDown(
      {required this.items,
      required this.onChanged,
      this.hintText = "",
      this.borderRadius = 0,
      this.borderWidth = 1,
      this.maxListHeight = 100,
      this.defaultSelectedIndex = -1,
      Key? key,
      this.enabled = true})
      : super(key: key);

  @override
  _CustDropDownState createState() => _CustDropDownState();
}

class _CustDropDownState extends State<CustDropDown>
    with WidgetsBindingObserver {
  bool _isOpen = false, _isAnyItemSelected = false, _isReverse = false;
  late OverlayEntry _overlayEntry;
  late RenderBox? _renderBox;
  Widget? _itemSelected;
  late Offset dropDownOffset;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          dropDownOffset = getOffset();
        });
      }
      if (widget.defaultSelectedIndex > -1) {
        if (widget.defaultSelectedIndex < widget.items.length) {
          if (mounted) {
            setState(() {
              _isAnyItemSelected = true;
              _itemSelected = widget.items[widget.defaultSelectedIndex];
              widget.onChanged(widget.items[widget.defaultSelectedIndex].value);
            });
          }
        }
      }
    });
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  void _addOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = true;
      });
    }
  }

  void _removeOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = false;
      });
    }
  }

  @override
  dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  Offset getOffset() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    double y = renderBox!.localToGlobal(Offset.zero).dy;
    double spaceAvailable = _getAvailableSpace(y + renderBox.size.height);
    if (spaceAvailable > widget.maxListHeight) {
      _isReverse = false;
      return Offset(0, renderBox.size.height);
    } else {
      _isReverse = true;
      return Offset(
          0,
          renderBox.size.height -
              (widget.maxListHeight + renderBox.size.height));
    }
  }

  double _getAvailableSpace(double offsetY) {
    double safePaddingTop = MediaQuery.of(context).padding.top;
    double safePaddingBottom = MediaQuery.of(context).padding.bottom;

    double screenHeight =
        MediaQuery.of(context).size.height - safePaddingBottom - safePaddingTop;

    return screenHeight - offsetY;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: widget.enabled
            ? () {
                _isOpen ? _removeOverlay() : _addOverlay();
              }
            : null,
        child: Container(
            width: 340,
            height: _isOpen ? widget.maxListHeight - 20 : 56,
            decoration: _getDecoration(),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: _isAnyItemSelected
                              ? _itemSelected!
                              : Text(
                                  widget.hintText,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontSize: 17,
                                      color: Color(0xff787878)),
                                ),
                        ),
                        _isOpen
                            ? Transform.rotate(
                                angle: 180 * math.pi / 180,
                                child: DearIcons.dropdown)
                            : DearIcons.dropdown
                      ],
                    ),
                    if (_isOpen) SizedBox(height: 10),
                    if (_isOpen)
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: widget.items
                            .map((item) => GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: item.child,
                                  ),
                                  onTap: () {
                                    if (mounted) {
                                      setState(() {
                                        _isAnyItemSelected = true;
                                        _itemSelected = item.child;
                                        _removeOverlay();
                                        if (widget.onChanged != null)
                                          widget.onChanged(item.value);
                                      });
                                    }
                                  },
                                ))
                            .toList(),
                      ),
                  ],
                ))),
      ),
    );
  }

  Decoration? _getDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        border: Border.all(width: 1, color: Color(0xffC5D0DA)));
  }
}

class CustDropdownMenuItem<T> extends StatelessWidget {
  final T value;
  final Widget child;

  const CustDropdownMenuItem({required this.value, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
