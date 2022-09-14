import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../services/location_service.dart';
import '../../../../widgets/custom_field.dart';
import '../../../../widgets/full_page_loader.dart';

class MapSearchList extends StatefulWidget {
  @override
  _MapSearchListState createState() => _MapSearchListState();
}

class _MapSearchListState extends State<MapSearchList> {
  TextEditingController _textEditingController =
      TextEditingController(text: '');
  List<dynamic> _datas = [];
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _mainWidget(),
        _isLoading ? FullPageLoader() : Container(),
      ],
    );
  }

  Widget _mainWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search New Journey'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomTextField(
              hintText: 'Search for new journey',
              textEditingController: _textEditingController,
              borderRadius: 16,
              suffixIcon: GestureDetector(
                onTap: () async {
                  setState(() => _isLoading = true);
                  try {
                    if (_textEditingController.text.trim().isNotEmpty &&
                        _isLoading) {
                      _datas = await LocationService.getLocations(
                        search: _textEditingController.text,
                      );
                    }
                  } catch (e) {
                    //
                  }
                  setState(() => _isLoading = false);
                },
                child: Icon(
                  Icons.search,
                ),
              ),
              contentPadding: null,
              onEditingComplete: () async {
                // setState(() => _isLoading = true);
                // if (_textEditingController.text.trim().isNotEmpty &&
                //     !_isLoading) {
                //   _datas = await LocationService.getLocations(
                //     search: _textEditingController.text,
                //   );
                // }
                // setState(() => _isLoading = false);
              },
            ),
          ),
          Expanded(
            child: _datas.length <= 0 ? _searchPlaceholder() : _searchedData(),
          ),
        ],
      ),
    );
  }

  Widget _searchedData() {
    return ListView.builder(
      itemCount: _datas.length,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            var data = await LocationService.getPlaceDetails(
              _datas[index]['place_id'],
            );
            log('data: $data');
            Navigator.pop(context, data);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Colors.blue[300],
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      _datas[index]['description'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              index == 10 - 1 ? Container() : Divider(thickness: 2),
            ],
          ),
        );
      },
    );
  }

  Widget _searchPlaceholder() {
    return Center(
      child: Text(
        "Can't find your location?",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
    );
  }
}
