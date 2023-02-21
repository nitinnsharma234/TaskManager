import 'package:flutter/material.dart';
import 'package:sharptimemanagement/Model/Your_Tasks.dart';
import 'package:sharptimemanagement/favouriteScreen.dart';

enum PopUpMenu { favourites, bookmarked, settings }

Widget DottedMenu(BuildContext context) {
  var selectedItem =null;
  return PopupMenuButton<PopUpMenu>(
    initialValue: selectedItem,
    onSelected: (PopUpMenu ex) {
      if(ex==PopUpMenu.favourites) {
        Navigator.of(context).pushNamed(FavouriteScreen.routeName);
      }
      selectedItem=ex;
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<PopUpMenu>>[
      const PopupMenuItem<PopUpMenu>(
        value: PopUpMenu.favourites,
        child: Text('Favourites'),
      ),
      const PopupMenuItem<PopUpMenu>(
        value: PopUpMenu.bookmarked,
        child: Text('Bookmarked'),
      ),
      const PopupMenuItem<PopUpMenu>(
        value: PopUpMenu.settings,
        child: Text('Settings'),
      ),
    ],
  );
}


