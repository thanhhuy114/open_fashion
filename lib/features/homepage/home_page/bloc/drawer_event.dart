part of 'drawer_bloc.dart';

sealed class DrawerEvent {
  const DrawerEvent();
}

class GetDrawer extends DrawerEvent{
  GetDrawer();
}
