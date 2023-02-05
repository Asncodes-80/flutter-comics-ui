import 'package:flutter/material.dart';
import 'package:flutter_comics_ui/src/l10n/generated/comics_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// # Create a ComicsApp from `WidgetsApp`
///
/// A convenience widget what wraps a number of widgets, that are commonly
/// required for comical-design application. It builds upon a [WidgetsApp] by
/// adding comics-design specific functionalities.
///
/// The [ComicsApp] configs the top-level [Navigator] to search for routes in
/// the following order:
///
/// 1. For the `/` route, the [home] property if no-null, is used. we know that
///    as [root] route.
///
/// 2. Otherwise, the [routes] table is used, if it has an entry for the routes.
///
/// 3. Otherwise, [onGenerateRoute] is called, if provided. It should return a
///    non-null value for any _valid_ route not handled by [home] and [routes].
///
/// 4. Finally if all else fails [onUnknownRoute] is called.
///
/// If a [Navigator] is created, at least one of these options must handle the
/// `/` route, since it is used when an invalid [initialRoute] is specified on
/// startup.
///
/// See also:
///
///   - [NavigationView], to provide comics app-wide navigation
///   - [Navigator], which is used to manage the app's stack of the pages.
///   - [WidgetsApp], which defines the basic app elements but doesn't depend on
///     the comics library.
class ComicsApp extends StatefulWidget {
  /// This Class creates an instance of [WidgetsApp].
  ///
  /// The boolean args, [routes], and [navigatorObservers], must not be null!
  const ComicsApp({
    Key? key,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initRoute,
    this.onGenerateRoute,
    this.onGenerateInitRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.builder,
    this.title = "",
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegate,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = ComicsLocalizations.supportedLocales,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticDebugger = false,
    this.debugShowCheckModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior = const ComicsScrollBehavior(),
    this.useInheritedMediaQuery = false,
  }) : super(key: key);

  /// Creates a [ComicsApp] that uses the [Router] instead of a [Navigator].
  ComicsApp.router({
    Key? key,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.routeInformationProvider,
    required this.routeInformationParser,
    required this.routerDelegate,
    BackButtonDispatcher? backButtonDispatcher,
    this.builder,
    this.title = "",
    this.onGenerateTitle,
    required Color this.color,
    this.locale,
    this.localizationsDelegate,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = ComicsLocalizations.supportedLocales,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticDebugger = false,
    this.debugShowCheckModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior = const ComicsScrollBehavior(),
    this.useInheritedMediaQuery = false,
    this.home,
    this.onGenerateRoute,
  })  : assert(routeInformationParser != null && routerDelegate != null,
            "The routeInformationParser and routeDelegate can't be null."),
        assert(supportedLocales.isNotEmpty),
        navigatorObservers = null,
        backButtonDispatcher =
            backButtonDispatcher ?? RootBackButtonDispatcher(),
        navigatorKey = null,
        onGenerateInitRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initRoute = null,
        super(key: key);

  /// # Default visual properties, like color palettes, typographies,shapes for
  /// this current app's Comics widgets
  ///
  /// The default value of this property is `ThemeData(brightness: Brightness.light)`
  final ThemeData? theme;

  /// # [ThemeData] to switch between `dark mode` and `light mode` preferences.
  ///
  /// Some platforms allow the users to switch between light and dark mode of an
  /// application. That is basics of a **system-wide**.
  ///
  /// theme property must should have a proper [ThemeData.brightness] to set it
  /// [Brightness.dark].
  ///
  /// This property is optional and default value is [ThemeData(brightness: Brightness.light)]
  /// when both [darkTheme] and [theme] were null.
  final ThemeData? darkTheme;

  /// Determines which theme will be used by the application if both [theme] and
  /// [darkTheme] are provided.
  ///
  /// If set to [ThemeMode.system], the choice of which theme to use will be
  /// based on the user's system preferences. If the
  /// [MediaQuery.platformBrightnessOf] is [Brightness.light], [theme] will be
  /// used. If it is [Brightness.dark], [darkTheme] will be used (unless it is
  /// null, in which case [theme] will be used.
  ///
  /// If set to [ThemeMode.light] the [theme] will always be used, regardless of
  /// the user's system preference.
  ///
  /// If set to [ThemeMode.dark] the [darkTheme] will be used regardless of the
  /// user's system preference. If [darkTheme] is null then it will fallback to
  /// using [theme].
  ///
  /// The default value is [ThemeMode.system].
  final ThemeMode? themeMode;

  /// {@macro flutter.widgets.widgetsApp.navigatorKey}
  final GlobalKey<NavigatorState>? navigatorKey;

  /// {@macro flutter.widgets.widgetsApp.home}
  final Widget? home;

  /// The applications top-level routing table
  ///
  /// This table is type of `namedRoute`. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is looked up in this map. If the
  /// name is present, the associated [WidgetBuilder] is used to construct a
  /// [ComicsPageRoute] that performs a proper transition, including [Hero]
  /// animations, to the new route.
  ///
  /// {@macro flutter.widgets.widgetApp.routes}
  final Map<String, WidgetBuilder>? routes;

  /// {@macro flutter.widgets.widgetApp.initialRoute}
  final String? initRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateRoute}
  final RouteFactory? onGenerateRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateInitialRoutes}
  final InitialRouteListFactory? onGenerateInitRoutes;

  /// {@macro flutter.widgets.widgetsApp.onUnknownRoute}
  final RouteFactory? onUnknownRoute;

  /// {@macro flutter.widgets.widgetsApp.navigatorObservers}
  final List<NavigatorObserver>? navigatorObservers;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  /// {@macro flutter.widgets.widgetsApp.builder}
  ///
  /// Comics specific features such as [showDialog] and [showMenu], and widgets
  /// such as [Tooltip], [PopupMenuButton], also require a [Navigator] to
  /// properly function.
  final TransitionBuilder? builder;

  /// {@macro flutter.widgets.widgetsApp.title}
  ///
  /// This value is passed unmodified to [WidgetsApp.onGenerateTitle].
  final String title;

  /// {@macro flutter.widgets.widgetsApp.title}
  ///
  /// This value is passed unmodified to [WidgetsApp.title]
  final GenerateAppTitle? onGenerateTitle;

  /// {@macro flutter.widgets.widgetsApp.color}
  final Color? color;

  /// {@macro flutter.widgets.widgetsApp.locale}
  final Locale? locale;

  /// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegate;

  /// {@macro flutter.widgets.widgetsApp.localeListResolutionCallback}
  ///
  /// This callback is passed long to the [WidgetsApp].
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// {@macro flutter.widgets.widgetsApp.localeResolutionCallback}
  final LocaleResolutionCallback? localeResolutionCallback;

  /// {@macro flutter.widgets.widgetsApp.supportedLocales}
  ///
  /// It is passed along unmodified to the [WidgetsApp]
  final Iterable<Locale> supportedLocales;

  /// Turns on a performance overlay.
  ///
  /// [See also](https://flutter.dev/debuggging/#performanceoverlay)
  final bool showPerformanceOverlay;

  /// Turns on `checkerboarding` of raster cache images.
  final bool checkerboardRasterCacheImages;

  /// Turns on `checkerboarding` of layers rendered to offscreen bitmaps.
  final bool checkerboardOffscreenLayers;

  /// Turns on an overlay that shows the accessibility information reported by
  /// the framework.
  final bool showSemanticDebugger;

  /// {@macro flutter.widgets.widgetsApp.debugShowCheckModeBanner}
  final bool debugShowCheckModeBanner;

  /// {@macro flutter.widgets.widgetsApp.shortcuts}
  /// {@tool snippet}
  /// This example show, how to add a single shortcut for
  /// [LogicalKeyboardKey.select] to the default shortcuts without needing to
  /// add your own [Shortcuts] widget.
  ///
  /// Alternatively, you could insert a [Shortcuts] widget with just the mapping
  /// you want you between the [ComicsApp] and its child and get the same
  /// effect.
  ///
  /// ```dart
  /// Widget build(BuildContext ctx) {
  ///   return ComicsApp(
  ///     shortcuts: <ShortcutActivator, Intent>{
  ///         ... WidgetsApp.defaultShortcuts,
  ///         const SingleActivator(LogicalKeyboardKey.select):
  ///               const ActivateIntent(),
  ///     },
  ///     color: const Color(0xFFF00000),
  ///     builder: (BuildContext context, Widget? child) {
  ///       return const Placeholder();
  ///     },
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  /// {@macro flutter.widgets.widgetsApp.shortcuts.seeAlso}
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// {@macro flutter.widgets.widgetsApp.actions}
  /// {@tool snippet}
  /// This example shows how to add a single action handling an [ActivateAction]
  /// to the default actions without needing to add your own [Actions] widget.
  ///
  /// Alternatively, you could insert an [Actions] widget with just the mapping
  /// you want to add between the [ComicsApp] and its child and get the same
  /// effect.
  ///
  /// ```dart
  /// Widget build(BuildContext ctx) {
  ///   return ComicsApp(
  ///     actions: <Type, Action<Intent>>{
  ///         ... WidgetsApp.defaultActions,
  ///         ActivateAction: CallbackAction(onInvoke:
  ///          Intent intent) {
  ///             // Do something here...
  ///             return null;
  ///          }
  ///     },
  ///     color: const Color(0xFFF00000),
  ///     builder: (BuildContext context, Widget? child) {
  ///       return const Placeholder();
  ///     },
  ///   );
  /// }
  /// ```
  ///
  /// {@end-tool}
  /// {@macro flutter.widgets.widgetsApp.actions.seeAlso}
  final Map<Type, Action<Intent>>? actions;

  /// {@macro flutter.widgets.widgetsApp.restorationScopeId}
  final String? restorationScopeId;

  /// {@macro flutter.material.materialApp.scrollBehavior}
  ///
  /// See also:
  ///
  /// - [ScrollConfiguration], which controls how [Scrollable] widgets behave in
  ///   a subtree.
  final ScrollBehavior scrollBehavior;

  /// {@macro flutter.widgets.widgetsApp.useInheritedMediaQuery}
  final bool useInheritedMediaQuery;

  @override
  State<ComicsApp> createState() => ComicsAppState();
}

class ComicsAppState extends State<ComicsApp> {
  late HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController();
  }

  /// Combine the l10n for Material with the ones contributed by the
  /// localizationDelegates parameter, if any. Only the first delegate of a
  /// particular `localizationDelegate.type` is loaded so the
  /// `localizationDelegate` parameter can be used to override
  /// `_ComicsLocalizationDelegate`
  Iterable<LocalizationsDelegate<dynamic>> get _localizationDelegate sync* {
    if (widget.localizationsDelegate != null) {
      yield* widget.localizationsDelegate!;
    }
    yield ComicsLocalizations.delegate;
    yield GlobalMaterialLocalizations.delegate;
    yield GlobalWidgetsLocalizations.delegate;
  }

  bool get _usesRouter => widget.routerDelegate != null;

  ThemeData theme(BuildContext ctx) {
    final mode = widget.themeMode ?? ThemeMode.system;
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final useDarkStyle = mode == ThemeMode.dark ||
        (mode == ThemeMode.system && platformBrightness == Brightness.dark);

    final data = () {
      late ThemeData result;
      if (useDarkStyle) {
        result = widget.darkTheme ?? widget.theme ?? ThemeData();
      } else {
        result = widget.theme ?? ThemeData();
      }
    }();
    return data;
  }

  Widget _builder(BuildContext ctx, Widget? child) {
    final ThemeData themeData = theme(ctx);
    final Theme? muiTheme = ctx.findAncestorWidgetOfExactType<Theme>();

    return AnimatedTheme(
      data: muiTheme?.data ??
          ThemeData(
            extensions: themeData.extensions.values,
            brightness: themeData.brightness,
            canvasColor: themeData.cardColor,
          ),
      // TODO: (wip) needs to build `AnimatedComicsTheme()`
      child: AnimatedComicsTheme(),
    );
  }

  _buildApp(BuildContext ctx) {
    final comicsColor = widget.color ?? Colors.purple;

    if (_usesRouter) {
      return WidgetsApp.router(
        key: GlobalObjectKey(this),
        routeInformationProvider: widget.routeInformationProvider,
        routeInformationParser: widget.routeInformationParser!,
        routerDelegate: widget.routerDelegate!,
        backButtonDispatcher: widget.backButtonDispatcher,
        builder: _builder,
        title: widget.title,
        onGenerateTitle: widget.onGenerateTitle,
        color: comicsColor,
        locale: widget.locale,
        localeResolutionCallback: widget.localeResolutionCallback,
        localeListResolutionCallback: widget.localeListResolutionCallback,
        supportedLocales: widget.supportedLocales,
        showPerformanceOverlay: widget.showPerformanceOverlay,
        checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
        showSemanticsDebugger: widget.showSemanticDebugger,
        debugShowCheckedModeBanner: widget.debugShowCheckModeBanner,
        shortcuts: widget.shortcuts,
        actions: widget.actions,
        restorationScopeId: widget.restorationScopeId,
        localizationsDelegates: _localizationDelegate,
        useInheritedMediaQuery: widget.useInheritedMediaQuery,
      );
    }
    // Instead of using [MaterialApp] use pure [WidgetsApp]
    return WidgetsApp(
      key: GlobalObjectKey(this),
      navigatorKey: widget.navigatorKey,
      navigatorObservers: widget.navigatorObservers!,
      home: widget.home,
      routes: widget.routes!,
      initialRoute: widget.initRoute,
      onGenerateRoute: widget.onGenerateRoute,
      onGenerateInitialRoutes: widget.onGenerateInitRoutes,
      onUnknownRoute: widget.onUnknownRoute,
      builder: _builder,
      title: widget.title,
      onGenerateTitle: widget.onGenerateTitle,
      color: comicsColor,
      locale: widget.locale,
      localeResolutionCallback: widget.localeResolutionCallback,
      localeListResolutionCallback: widget.localeListResolutionCallback,
      supportedLocales: widget.supportedLocales,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
      showSemanticsDebugger: widget.showSemanticDebugger,
      debugShowCheckedModeBanner: widget.debugShowCheckModeBanner,
      shortcuts: widget.shortcuts,
      actions: widget.actions,
      restorationScopeId: widget.restorationScopeId,
      localizationsDelegates: _localizationDelegate,
      useInheritedMediaQuery: widget.useInheritedMediaQuery,
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        // TODO: (wip) needs to develop `ComicsPageRoute`
        return ComicsPageRoute<T>(settings: settings, builder: builder);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final result = _buildApp(context);

    return ScrollConfiguration(
      behavior: widget.scrollBehavior,
      child: HeroControllerScope(controller: _heroController, child: result),
    );
  }
}

/// Describes how [Scrollable] widgets behave for [ComicsApp]s.
///
/// {@macro flutter.widgets.scrollBehavior}
///
/// When using the desktop platforms, if the [Scrollable] widget scrolls in the
/// [Axis.vertical], a [Scrollbar] is applied.
///
/// See also:
///
/// - [ScrollBehavior]: the default scrolling behavior extended by this class.
class ComicsScrollBehavior extends ScrollBehavior {
  /// Creates a [ComicsScrollBehavior] that decorates [Scrollable]s with
  /// [Scrollbar]s based on the current platform and provided
  /// [ScrollableDetails].
  const ComicsScrollBehavior();

  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    switch (axisDirectionToAxis(details.direction)) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        switch (getPlatform(context)) {
          case TargetPlatform.windows:
          case TargetPlatform.macOS:
          case TargetPlatform.linux:
            return Scrollbar(
              controller: details.controller,
              child: child,
            );
          case TargetPlatform.android:
          case TargetPlatform.iOS:
          case TargetPlatform.fuchsia:
            return child;
        }
    }
  }
}
