import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/menu_widget.dart';
import 'menu_list.dart';
import 'model/menu_model.dart';

class SearchMoreService extends StatefulWidget {
  const SearchMoreService({super.key});

  @override
  State<SearchMoreService> createState() => _SearchMoreServiceState();
}

class _SearchMoreServiceState extends State<SearchMoreService> {
  List<MenuModel> _allMenus = [];
  List<MenuModel> _filteredMenus = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _allMenus = moreServiceMenuList.expand((category) {
      return category.menus;
    }).toList();
    _filteredMenus = _allMenus;
  }

  void _filterMenus(String query) {
    setState(() {
      _searchQuery = query;
      if (_searchQuery.isEmpty) {
        _filteredMenus = _allMenus;
      } else {
        _filteredMenus = _allMenus.where((menu) {
          return menu.name.toLowerCase().startsWith(_searchQuery.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
          onChanged: (value) {
            _filterMenus(value);
          },
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ),
      body: _buildAllMenusWrap(),
    );
  }

  Widget _buildAllMenusWrap() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Center(
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: _filteredMenus.map((menu) {
              // return GridMenuWidget(name: menu.name);
              return GridMenuWidget(modelInfo: menu);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
