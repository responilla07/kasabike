import 'package:flutter/material.dart';

import '../../../data/global.dart';

class FABBottomAppBarItem {
  IconData iconData;
  String text;
  String imageAsset;
  final int badgeValue;
  FABBottomAppBarItem({
    this.iconData,
    this.text,
    this.badgeValue,
    this.imageAsset,
  });
}

class FABBottomAppBar extends StatefulWidget {
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  final String imageAsset;

  FABBottomAppBar({
    Key key,
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
    this.imageAsset,
  })  : assert(items.length == 2 || items.length == 4),
        super(key: key);

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  selectIndex(int index) {
    _updateIndex(index);
  }

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    double phoneHeight = MediaQuery.of(context).size.height;
    double size = ((phoneHeight / 16.8) / (textScaleFactor * pi));

    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
          item: widget.items[index],
          index: index,
          onPressed: _updateIndex,
          size: size,
          textScaleFactor: textScaleFactor);
    });
    if (widget.centerItemText != null) {
      items.insert(items.length >> 1,
          _buildMiddleTabItem(size: size, textScaleFactor: textScaleFactor));
    }

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem({double size, textScaleFactor}) {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color, fontSize: size),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(
      {FABBottomAppBarItem item,
      int index,
      ValueChanged<int> onPressed,
      double size,
      textScaleFactor}) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
              onTap: () => onPressed(index),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      item.iconData != null
                          ? Icon(item.iconData,
                              color: color, size: widget.iconSize)
                          : Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                item.imageAsset,
                                height: 20,
                                color: color,
                              ),
                            ),
                      // Text(
                      //   item.text,
                      //   style: TextStyle(color: color, fontSize: size),
                      // )
                    ],
                  ),
                  item.badgeValue != null
                      ? Positioned(
                          right: 20,
                          top: 4,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              // color: AppColors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            constraints:
                                BoxConstraints(minWidth: 16.0, minHeight: 16.0),
                            child: Text(
                              item.badgeValue.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: size),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Container()
                ],
              )),
        ),
      ),
    );
  }
}
