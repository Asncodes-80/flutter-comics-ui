import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter/widgets.dart';

import './ComicsLocalizationsEn.dart';
import './ComicsLocalizationsFa.dart';

/// # Comics App Localization
///
/// ## Callers can lookup localized strings wi an instance of
/// ComicsLocalizations returned by `ComicsLocalizations.of(context)`
///
/// Applications need to include `ComicsLocalizations.delegate()` in their app's
/// `delegate` list, and the locales they support in app's `supportedLocales`
/// list. For example:
///
/// ```dart
/// import 'generated/comics_localizations.dart'
///
/// return MaterialApp(
///   localizationDelegates: ComicsLocalizations.delegate,
///   supportedLocales: ComicsLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Developers
/// To add new locale you should:
///
/// - Add it inside of [supportedLocales] list.
/// - next crate new dart file and call it `ComicsLocalizations{localeCode}.dart`
/// - Use abstract properties of ComicsLocalization into
///   `ComicsLocalizations{localeCode}` class
/// - Add new locale into [_ComicsLocalizationsDelegate] in [isSupported] method
///
/// ## Update `pubspec.yaml`
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use proper version next to `flutter_localizations`
///   ...
/// ```
///
/// ## iOS Apps
///
/// iOS apps define key application metadata, including supported locales, in an
/// `Info.plist` file that is built into the application bundle. To config the
/// locales supported by your app, you will need to edit this file.
///
/// First, open you  project's `ios/Runner.xcworkspace` Xcode workspace file.
/// Then, in the Project Navigator, open the `Info.plist` file under the Runner
/// project's Runner directory. Next, select the Information Property List item,
/// select Add Item from the Editor menu, then select Localizations from the
/// pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each locale
/// your app supports, add a new item and select the locale you wish yto add
/// from the pop-ups menu in the Value field. This List should be consistent
/// with the languages listed in the `ComicsLocalizations.supportedLocales`
/// property.
abstract class ComicsLocalizations {
  ComicsLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ComicsLocalizations of(BuildContext ctx) {
    return Localizations.of<ComicsLocalizations>(ctx, ComicsLocalizations)!;
  }

  static const LocalizationsDelegate<ComicsLocalizations> delegate =
      _ComicsLocalizationsDelegate();

  /// List of Localizations delegate with default localizations delegate
  ///
  /// Returns a list of localizations delegates containing this delegate along
  /// with `GlobalMaterialLocalizations.delegate`,
  /// `GlobalCupertinoLocalizations.delegate`, and
  /// `GlobalWidgetsLocalizations.delegate`.
  ///
  /// Additional delegates can be added by appending to this list in
  /// **MaterialApp**. This list doesn't have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale("ar"),
    Locale("en"),
    Locale("fa"),
    Locale("tr")
  ];

  /// The Tooltip Text strings
  /// In en, this message translates to **Back**
  String get backButtonTooltip;

  /// Label for "close" buttons and menu items.
  ///
  /// In en, this message translates to **Close**
  String get closeButtonLabel;

  /// Label for "search" text fields.
  ///
  /// In en, this message translates to **Search**
  String get searchLabel;

  /// The Tooltip for the toggle navigation button
  ///
  /// In en, this message translates to **Close Navigation**
  String get closeNavigationTooltip;

  /// The Tooltip for the toggle navigation button.
  ///
  /// In en, this message translates to **Open Navigation**
  String get openNavigationTooltip;

  /// The Tooltip for the "Click to Search" button.
  ///
  /// In en, this message translates to **Click to search**
  String get clickToSearch;

  /// Label read out by accessibility tools (TalkBack or VoiceOver) for a modal
  /// barrier to indicate that a tap dismisses the barrier. A modal barrier can
  /// for example be found behind an alert or popup to block user interaction
  /// with elements behind it.
  ///
  /// In en, this message translates to:
  /// **Dismiss**
  String get modalBarrierDismissLabel;

  /// The tooltip used by the "Minimize" button on desktop windows.
  ///
  /// In en, this message translates to:
  /// **Minimize**
  String get minimizeWindowTooltip;

  /// The tooltip used by the "Restore" button on desktop windows.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restoreWindowTooltip;

  /// The tooltip used by the "Close" button on desktop windows.
  ///
  /// In en, this message translates to:
  /// **Close**
  String get closeWindowTooltip;

  /// The dialog label.
  ///
  /// In en, this message translates to:
  /// **Dialog**
  String get dialogLabel;

  /// The label for the cut action on the text selection controls.
  ///
  /// In en, this message translates to:
  /// **Cut**
  String get cutActionLabel;

  /// The label for the copy action on the text selection controls.
  ///
  /// In en, this message translates to:
  /// **Copy**
  String get copyActionLabel;

  /// The label for the paste button on the text selection controls.
  ///
  /// In en, this message translates to:
  /// **Paste**
  String get pasteActionLabel;

  /// The label for the select all button on the text selection controls.
  ///
  /// In en, this message translates to:
  /// **Select all**
  String get selectAllActionLabel;

  /// The label used by [TabView]'s new button.
  ///
  /// In en, this message translates to:
  /// **Add new tab**
  String get newTabLabel;

  /// The label used by [TabView]'s close button.
  ///
  /// In en, this message translates to:
  /// **Close tab**
  String get closeTabLabelSuffix;

  /// The label used by [TabView]'s scroll backward button.
  ///
  /// In en, this message translates to:
  /// **Scroll tab list backward**
  String get scrollTabBackwardLabel;

  /// The label used by [TabView]'s scroll forward button.
  ///
  /// In en, this message translates to:
  /// **Scroll tab list forward**
  String get scrollTabForwardLabel;

  /// The label used by [AutoSuggestBox] when the results can't be found.
  ///
  /// In en, this message translates to:
  /// **No results found**
  String get noResultsFoundLabel;

  /// The tooltip for the copy action on the text selection controls.
  ///
  /// In en, this message translates to:
  /// **Copy the selected content to the clipboard**
  String get copyActionTooltip;

  /// The tooltip for the cut action on the text selection controls.
  ///
  /// In en, this message translates to:
  /// **Remove the selected content and put it in the clipboard**
  String get cutActionTooltip;

  /// The tooltip for the paste action on the text selection controls.
  ///
  /// In en, this message translates to:
  /// **Inserts the contents of the clipboard at the current location**
  String get pasteActionTooltip;

  /// The tooltip for the select all action on the text selection controls.
  ///
  /// In en, this message translates to:
  /// **Select all content**
  String get selectAllActionTooltip;

  /// The text used by [TimePicker] for the hour field.
  ///
  /// In en, this message translates to:
  /// **hour**
  String get hour;

  /// The text used by [TimePicker] for the minute field.
  ///
  /// In en, this message translates to:
  /// **minute**
  String get minute;

  /// The text used by [TimePicker] for the AM field.
  ///
  /// In en, this message translates to:
  /// **AM**
  String get am;

  /// The text used by [TimePicker] for the PM field.
  ///
  /// In en, this message translates to:
  /// **PM**
  String get pm;

  /// The text used by [DatePicker] for the month field
  ///
  /// In en, this message translates to:
  /// **month**
  String get month;

  /// The text used by [DatePicker] for the day field
  ///
  /// In en, this message translates to:
  /// **day**
  String get day;

  /// The text used by [DatePicker] for the year field
  ///
  /// In en, this message translates to:
  /// **year**
  String get year;
}

class _ComicsLocalizationsDelegate
    extends LocalizationsDelegate<ComicsLocalizations> {
  const _ComicsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      <String>["ar", "en", "fa", "tr"].contains(locale.languageCode);

  @override
  Future<ComicsLocalizations> load(Locale locale) {
    return SynchronousFuture<ComicsLocalizations>(
        lookupComicsLocalizations(locale));
  }

  @override
  bool shouldReload(_ComicsLocalizationsDelegate old) => false;
}

ComicsLocalizations lookupComicsLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case "en":
      return ComicsLocalizationsEn();
    case "fa":
      return ComicsLocalizationsFa();
  }

  throw FlutterError('ComicsLocalizations.delegate failed to load unsupported'
      'locale: $locale. This is likely an issue with the localizations generation tool.'
      'Please create an issue on GitHub with a reproducible sample app and the gen-l10n'
      'configuration that was used.');
}
