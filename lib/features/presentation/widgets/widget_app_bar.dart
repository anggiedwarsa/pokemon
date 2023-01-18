import 'package:flutter/material.dart';
import 'package:pokemon/config/flavor_config.dart';
import 'package:pokemon/core/util/styles/colors.dart';
import 'package:pokemon/features/presentation/widgets/widget_helper.dart';

/// Widget ini berfungsi sebagai custom AppBar yang digunakan pada aplikasi<br />
///
/// [titleText] - judul dari AppBar<br />
/// [leading] - widget pada bagian paling kiri dari AppBar, sebelum title <br />
/// [backgroundColor] warna latar belakang dari AppBar <br />
/// [iconTheme] theme dari icon pada AppBar <br />
/// [automaticallyImplyLeading] otomatis menambah default leading atau tidak <br />
/// [centerTitle] menengahkan judul atau tidak <br />
/// [elevation] elevation dari AppBar <br />
/// [bottom] widget dibawah AppBar <br />
/// [actions] Widget tambahan di sebalah kanan AppBar <br />
class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final String? titleText;
  final Widget? leading;
  final Color? backgroundColor;
  final IconThemeData? iconTheme;
  final bool automaticallyImplyLeading;
  final bool? centerTitle;
  final double? titleSpacing;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;

  WidgetAppBar({
    super.key,
    this.title,
    this.titleText,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.iconTheme,
    this.automaticallyImplyLeading = true,
    this.centerTitle,
    this.titleSpacing,
    this.elevation = 0.0,
    this.bottom,
  });

  final widgetHelper = WidgetHelper();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    final listActionsAppBar = <Widget>[];
    if (actions != null) {
      listActionsAppBar.addAll(actions!);
    }
    return AppBar(
      title: title ?? Text(titleText ?? ''),
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing ?? 10,
      iconTheme: iconTheme ??
          const IconThemeData(
            color: BaseColor.secondaryColor,
          ),
      backgroundColor: backgroundColor ?? FlavorConfig.instance?.colorAccent,
      actions: listActionsAppBar,
      elevation: elevation,
      bottom: bottom,
    );
  }
}
