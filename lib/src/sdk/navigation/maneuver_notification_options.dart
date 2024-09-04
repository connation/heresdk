// Copyright (c) 2018-2024 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:ffi';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/unit_system.dart';
import 'package:here_sdk/src/sdk/navigation/direction_information_usage_option.dart';
import 'package:here_sdk/src/sdk/navigation/localized_text_usage_option.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_type.dart';
import 'package:here_sdk/src/sdk/navigation/natural_guidance_type.dart';
import 'package:here_sdk/src/sdk/navigation/notification_format_option.dart';
import 'package:here_sdk/src/sdk/routing/text_usage_options.dart';

/// A class containing all options to be used when generating maneuver notifications.

class ManeuverNotificationOptions {
  /// The language in which the notifications will be generated. When the specified language
  /// is not supported, the default language is used, which is English (American).
  LanguageCode language;

  /// Defines the measurement system used for distances. Defaults to metric.
  UnitSystem unitSystem;

  /// List of [ManeuverNotificationType] for which notifications should be generated. Excluding all of
  /// them will disable the maneuver notifications completely.
  /// By default, all types are included.
  List<ManeuverNotificationType> includedNotificationTypes;

  /// A flag that indicates whether notification for roundabout-related maneuvers should be generated.
  /// Defaults to true.
  bool enableRoundaboutNotification;

  /// A flag that indicates whether notification for destination/stopover reached maneuvers should be generated.
  /// Defaults to true.
  bool enableDestinationReachedNotification;

  /// A flag that indicates whether combined maneuver notifications should be generated.
  /// Such double notifications can be useful when maneuvers are very close.
  /// Example for a combined message: "After 300 meters turn left and then turn right.".
  /// This way a user can better anticipate the next-next maneuver.
  /// Note that setting to true will make the notification longer as two maneuvers will be merged into one.
  /// When the next-next maneuver action takes place, the notification will be given as usual. Example:
  /// "Now turn left and then then turn right." will be followed by "Now turn right.".
  /// Defaults to true.
  bool enableDoubleNotification;

  /// A flag that indicates whether phonemes in selected notification format for proper nouns (e.g. road names,
  /// road numbers, city names) should be used when generating notifications. Direction information comes usually
  /// in orthographic form and phoneme (e.g. Wall Street and "wɔːl"striːt). However, when the notification is
  /// synthesized by a TTS engine, the pronunciation of the orthographic form solely depends on its capability
  /// and phoneme set. The use of our phoneme data in the notification usually makes the pronunciation of
  /// direction information sound more natural. **Note:** For now, this property is functional for road name
  /// and road number information only.
  /// Defaults to false.
  bool enablePhoneme;

  /// A formatting option for the phoneme that is included in the notification. By default, no phoneme is used
  /// and the [NotificationFormatOption.plain] orthographic form is included in the notification.
  ///
  /// **Note:**
  /// To use the SSML format for phonemes, [ManeuverNotificationOptions.enablePhoneme] needs to be set to `true`.
  NotificationFormatOption notificationFormatOption;

  /// An option whether street name should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].
  @Deprecated("Will be removed in v4.22.0. Use [ManeuverNotificationOptions.textUsageOptions] instead.")
  LocalizedTextUsageOption streetNameUsageOption;

  /// An option whether road number should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].
  @Deprecated("Will be removed in v4.22.0. Use [ManeuverNotificationOptions.textUsageOptions] instead.")
  LocalizedTextUsageOption roadNumberUsageOption;

  /// An option whether signpost direction should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].
  @Deprecated("Will be removed in v4.22.0. Use [ManeuverNotificationOptions.textUsageOptions] instead.")
  LocalizedTextUsageOption signpostDirectionUsageOption;

  /// An option whether street name, road number and sign post direction should be used when generating notification.
  /// Defaults to each attribute as [LocalizedTextPreference.useAlways].
  TextUsageOptions textUsageOptions;

  /// A flag that indicates whether highway exit information should be used when generating notification.
  /// Defaults to true.
  bool enableHighwayExit;

  /// List of [NaturalGuidanceType] should be included in the notifications. Excluding
  /// all of them will disable natural guidance information in the notifications completely.
  ///
  /// By default, the list is empty and natural guidance is disabled.
  List<NaturalGuidanceType> includedNaturalGuidanceTypes;

  /// An option whether direction information should be used when generating notification with
  /// [ManeuverNotificationType.action]. Defaults to [DirectionInformationUsageOption.none].
  DirectionInformationUsageOption directionInformationUsageForActionNotificationOption;

  /// Creates a new instance.

  /// [language] The language in which the notifications will be generated. When the specified language
  /// is not supported, the default language is used, which is English (American).

  /// [unitSystem] Defines the measurement system used for distances. Defaults to metric.

  /// [includedNotificationTypes] List of [ManeuverNotificationType] for which notifications should be generated. Excluding all of
  /// them will disable the maneuver notifications completely.
  /// By default, all types are included.

  /// [enableRoundaboutNotification] A flag that indicates whether notification for roundabout-related maneuvers should be generated.
  /// Defaults to true.

  /// [enableDestinationReachedNotification] A flag that indicates whether notification for destination/stopover reached maneuvers should be generated.
  /// Defaults to true.

  /// [enableDoubleNotification] A flag that indicates whether combined maneuver notifications should be generated.
  /// Such double notifications can be useful when maneuvers are very close.
  /// Example for a combined message: "After 300 meters turn left and then turn right.".
  /// This way a user can better anticipate the next-next maneuver.
  /// Note that setting to true will make the notification longer as two maneuvers will be merged into one.
  /// When the next-next maneuver action takes place, the notification will be given as usual. Example:
  /// "Now turn left and then then turn right." will be followed by "Now turn right.".
  /// Defaults to true.

  /// [enablePhoneme] A flag that indicates whether phonemes in selected notification format for proper nouns (e.g. road names,
  /// road numbers, city names) should be used when generating notifications. Direction information comes usually
  /// in orthographic form and phoneme (e.g. Wall Street and "wɔːl"striːt). However, when the notification is
  /// synthesized by a TTS engine, the pronunciation of the orthographic form solely depends on its capability
  /// and phoneme set. The use of our phoneme data in the notification usually makes the pronunciation of
  /// direction information sound more natural. **Note:** For now, this property is functional for road name
  /// and road number information only.
  /// Defaults to false.

  /// [notificationFormatOption] A formatting option for the phoneme that is included in the notification. By default, no phoneme is used
  /// and the [NotificationFormatOption.plain] orthographic form is included in the notification.
  ///
  /// **Note:**
  /// To use the SSML format for phonemes, [ManeuverNotificationOptions.enablePhoneme] needs to be set to `true`.

  /// [streetNameUsageOption] An option whether street name should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].

  /// [roadNumberUsageOption] An option whether road number should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].

  /// [signpostDirectionUsageOption] An option whether signpost direction should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].

  /// [textUsageOptions] An option whether street name, road number and sign post direction should be used when generating notification.
  /// Defaults to each attribute as [LocalizedTextPreference.useAlways].

  /// [enableHighwayExit] A flag that indicates whether highway exit information should be used when generating notification.
  /// Defaults to true.

  /// [includedNaturalGuidanceTypes] List of [NaturalGuidanceType] should be included in the notifications. Excluding
  /// all of them will disable natural guidance information in the notifications completely.
  ///
  /// By default, the list is empty and natural guidance is disabled.

  /// [directionInformationUsageForActionNotificationOption] An option whether direction information should be used when generating notification with
  /// [ManeuverNotificationType.action]. Defaults to [DirectionInformationUsageOption.none].

  ManeuverNotificationOptions._(this.language, this.unitSystem, this.includedNotificationTypes, this.enableRoundaboutNotification, this.enableDestinationReachedNotification, this.enableDoubleNotification, this.enablePhoneme, this.notificationFormatOption, this.streetNameUsageOption, this.roadNumberUsageOption, this.signpostDirectionUsageOption, this.textUsageOptions, this.enableHighwayExit, this.includedNaturalGuidanceTypes, this.directionInformationUsageForActionNotificationOption);
  /// Creates a new instance of this class with default configurations.
  ManeuverNotificationOptions.withDefaults()
      : language = LanguageCode.enUs, unitSystem = UnitSystem.metric, includedNotificationTypes = [ManeuverNotificationType.range, ManeuverNotificationType.reminder, ManeuverNotificationType.distance, ManeuverNotificationType.action], enableRoundaboutNotification = true, enableDestinationReachedNotification = true, enableDoubleNotification = true, enablePhoneme = false, notificationFormatOption = NotificationFormatOption.plain, streetNameUsageOption = LocalizedTextUsageOption.always, roadNumberUsageOption = LocalizedTextUsageOption.always, signpostDirectionUsageOption = LocalizedTextUsageOption.always, textUsageOptions = TextUsageOptions(), enableHighwayExit = true, includedNaturalGuidanceTypes = [], directionInformationUsageForActionNotificationOption = DirectionInformationUsageOption.none;
  /// Creates a new instance of this class with specified language and unit system.
  /// [language] The language in which the notifications will be generated. When the specified language
  /// is not supported, the default language is used, which is English (American).
  /// [unitSystem] Defines the measurement system used for distances. Defaults to metric.
  ManeuverNotificationOptions(this.language, this.unitSystem)
      : includedNotificationTypes = [ManeuverNotificationType.range, ManeuverNotificationType.reminder, ManeuverNotificationType.distance, ManeuverNotificationType.action], enableRoundaboutNotification = true, enableDestinationReachedNotification = true, enableDoubleNotification = true, enablePhoneme = false, notificationFormatOption = NotificationFormatOption.plain, streetNameUsageOption = LocalizedTextUsageOption.always, roadNumberUsageOption = LocalizedTextUsageOption.always, signpostDirectionUsageOption = LocalizedTextUsageOption.always, textUsageOptions = TextUsageOptions(), enableHighwayExit = true, includedNaturalGuidanceTypes = [], directionInformationUsageForActionNotificationOption = DirectionInformationUsageOption.none;
  /// Creates a new instance of this class with full specified configurations.
  /// [language] The language in which the notifications will be generated. When the specified language
  /// is not supported, the default language is used, which is English (American).
  /// [unitSystem] Defines the measurement system used for distances. Defaults to metric.
  /// [includedNotificationTypes] List of [ManeuverNotificationType] for which notifications should be generated. Excluding all of
  /// them will disable the maneuver notifications completely.
  /// By default, all types are included.
  /// [enableRoundaboutNotification] A flag that indicates whether notification for roundabout-related maneuvers should be generated.
  /// Defaults to true.
  /// [enableDestinationReachedNotification] A flag that indicates whether notification for destination/stopover reached maneuvers should be generated.
  /// Defaults to true.
  /// [enableDoubleNotification] A flag that indicates whether combined maneuver notifications should be generated.
  /// Such double notifications can be useful when maneuvers are very close.
  /// Example for a combined message: "After 300 meters turn left and then turn right.".
  /// This way a user can better anticipate the next-next maneuver.
  /// Note that setting to true will make the notification longer as two maneuvers will be merged into one.
  /// When the next-next maneuver action takes place, the notification will be given as usual. Example:
  /// "Now turn left and then then turn right." will be followed by "Now turn right.".
  /// Defaults to true.
  /// [enablePhoneme] A flag that indicates whether phonemes in selected notification format for proper nouns (e.g. road names,
  /// road numbers, city names) should be used when generating notifications. Direction information comes usually
  /// in orthographic form and phoneme (e.g. Wall Street and "wɔːl"striːt). However, when the notification is
  /// synthesized by a TTS engine, the pronunciation of the orthographic form solely depends on its capability
  /// and phoneme set. The use of our phoneme data in the notification usually makes the pronunciation of
  /// direction information sound more natural. **Note:** For now, this property is functional for road name
  /// and road number information only.
  /// Defaults to false.
  /// [textUsageOptions] An option whether street name, road number and sign post direction should be used when generating notification.
  /// Defaults to each attribute as [LocalizedTextPreference.useAlways].
  /// [enableHighwayExit] A flag that indicates whether highway exit information should be used when generating notification.
  /// Defaults to true.
  ManeuverNotificationOptions.withTextUsageOption(this.language, this.unitSystem, this.includedNotificationTypes, this.enableRoundaboutNotification, this.enableDestinationReachedNotification, this.enableDoubleNotification, this.enablePhoneme, this.textUsageOptions, this.enableHighwayExit)
      : notificationFormatOption = NotificationFormatOption.plain, streetNameUsageOption = LocalizedTextUsageOption.always, roadNumberUsageOption = LocalizedTextUsageOption.always, signpostDirectionUsageOption = LocalizedTextUsageOption.always, includedNaturalGuidanceTypes = [], directionInformationUsageForActionNotificationOption = DirectionInformationUsageOption.none;
  /// Creates a new instance of this class with full specified configurations.
  /// [language] The language in which the notifications will be generated. When the specified language
  /// is not supported, the default language is used, which is English (American).
  /// [unitSystem] Defines the measurement system used for distances. Defaults to metric.
  /// [includedNotificationTypes] List of [ManeuverNotificationType] for which notifications should be generated. Excluding all of
  /// them will disable the maneuver notifications completely.
  /// By default, all types are included.
  /// [enableRoundaboutNotification] A flag that indicates whether notification for roundabout-related maneuvers should be generated.
  /// Defaults to true.
  /// [enableDestinationReachedNotification] A flag that indicates whether notification for destination/stopover reached maneuvers should be generated.
  /// Defaults to true.
  /// [enableDoubleNotification] A flag that indicates whether combined maneuver notifications should be generated.
  /// Such double notifications can be useful when maneuvers are very close.
  /// Example for a combined message: "After 300 meters turn left and then turn right.".
  /// This way a user can better anticipate the next-next maneuver.
  /// Note that setting to true will make the notification longer as two maneuvers will be merged into one.
  /// When the next-next maneuver action takes place, the notification will be given as usual. Example:
  /// "Now turn left and then then turn right." will be followed by "Now turn right.".
  /// Defaults to true.
  /// [enablePhoneme] A flag that indicates whether phonemes in selected notification format for proper nouns (e.g. road names,
  /// road numbers, city names) should be used when generating notifications. Direction information comes usually
  /// in orthographic form and phoneme (e.g. Wall Street and "wɔːl"striːt). However, when the notification is
  /// synthesized by a TTS engine, the pronunciation of the orthographic form solely depends on its capability
  /// and phoneme set. The use of our phoneme data in the notification usually makes the pronunciation of
  /// direction information sound more natural. **Note:** For now, this property is functional for road name
  /// and road number information only.
  /// Defaults to false.
  /// [streetNameUsageOption] An option whether street name should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].
  /// [roadNumberUsageOption] An option whether road number should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].
  /// [signpostDirectionUsageOption] An option whether signpost direction should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].
  /// [enableHighwayExit] A flag that indicates whether highway exit information should be used when generating notification.
  /// Defaults to true.
  ManeuverNotificationOptions.withAllFields(this.language, this.unitSystem, this.includedNotificationTypes, this.enableRoundaboutNotification, this.enableDestinationReachedNotification, this.enableDoubleNotification, this.enablePhoneme, this.streetNameUsageOption, this.roadNumberUsageOption, this.signpostDirectionUsageOption, this.enableHighwayExit)
      : notificationFormatOption = NotificationFormatOption.plain, textUsageOptions = TextUsageOptions(), includedNaturalGuidanceTypes = [], directionInformationUsageForActionNotificationOption = DirectionInformationUsageOption.none;
  /// Creates a new instance of this class with full specified configurations.
  /// [language] The language in which the notifications will be generated. When the specified language
  /// is not supported, the default language is used, which is English (American).
  /// [unitSystem] Defines the measurement system used for distances. Defaults to metric.
  /// [includedNotificationTypes] List of [ManeuverNotificationType] for which notifications should be generated. Excluding all of
  /// them will disable the maneuver notifications completely.
  /// By default, all types are included.
  /// [enableRoundaboutNotification] A flag that indicates whether notification for roundabout-related maneuvers should be generated.
  /// Defaults to true.
  /// [enableDestinationReachedNotification] A flag that indicates whether notification for destination/stopover reached maneuvers should be generated.
  /// Defaults to true.
  /// [enableDoubleNotification] A flag that indicates whether combined maneuver notifications should be generated.
  /// Such double notifications can be useful when maneuvers are very close.
  /// Example for a combined message: "After 300 meters turn left and then turn right.".
  /// This way a user can better anticipate the next-next maneuver.
  /// Note that setting to true will make the notification longer as two maneuvers will be merged into one.
  /// When the next-next maneuver action takes place, the notification will be given as usual. Example:
  /// "Now turn left and then then turn right." will be followed by "Now turn right.".
  /// Defaults to true.
  /// [enablePhoneme] A flag that indicates whether phonemes in selected notification format for proper nouns (e.g. road names,
  /// road numbers, city names) should be used when generating notifications. Direction information comes usually
  /// in orthographic form and phoneme (e.g. Wall Street and "wɔːl"striːt). However, when the notification is
  /// synthesized by a TTS engine, the pronunciation of the orthographic form solely depends on its capability
  /// and phoneme set. The use of our phoneme data in the notification usually makes the pronunciation of
  /// direction information sound more natural. **Note:** For now, this property is functional for road name
  /// and road number information only.
  /// Defaults to false.
  /// [notificationFormatOption] A formatting option for the phoneme that is included in the notification. By default, no phoneme is used
  /// and the [NotificationFormatOption.plain] orthographic form is included in the notification.
  ///
  /// **Note:**
  /// To use the SSML format for phonemes, [ManeuverNotificationOptions.enablePhoneme] needs to be set to `true`.
  /// [streetNameUsageOption] An option whether street name should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].
  /// [roadNumberUsageOption] An option whether road number should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].
  /// [signpostDirectionUsageOption] An option whether signpost direction should be used when generating notification.
  /// Defaults to [LocalizedTextUsageOption.always].
  /// [enableHighwayExit] A flag that indicates whether highway exit information should be used when generating notification.
  /// Defaults to true.
  ManeuverNotificationOptions.withAllFieldsNew(this.language, this.unitSystem, this.includedNotificationTypes, this.enableRoundaboutNotification, this.enableDestinationReachedNotification, this.enableDoubleNotification, this.enablePhoneme, this.notificationFormatOption, this.streetNameUsageOption, this.roadNumberUsageOption, this.signpostDirectionUsageOption, this.enableHighwayExit)
      : textUsageOptions = TextUsageOptions(), includedNaturalGuidanceTypes = [], directionInformationUsageForActionNotificationOption = DirectionInformationUsageOption.none;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ManeuverNotificationOptions) return false;
    ManeuverNotificationOptions _other = other;
    return language == _other.language &&
        unitSystem == _other.unitSystem &&
        DeepCollectionEquality().equals(includedNotificationTypes, _other.includedNotificationTypes) &&
        enableRoundaboutNotification == _other.enableRoundaboutNotification &&
        enableDestinationReachedNotification == _other.enableDestinationReachedNotification &&
        enableDoubleNotification == _other.enableDoubleNotification &&
        enablePhoneme == _other.enablePhoneme &&
        notificationFormatOption == _other.notificationFormatOption &&
        streetNameUsageOption == _other.streetNameUsageOption &&
        roadNumberUsageOption == _other.roadNumberUsageOption &&
        signpostDirectionUsageOption == _other.signpostDirectionUsageOption &&
        textUsageOptions == _other.textUsageOptions &&
        enableHighwayExit == _other.enableHighwayExit &&
        DeepCollectionEquality().equals(includedNaturalGuidanceTypes, _other.includedNaturalGuidanceTypes) &&
        directionInformationUsageForActionNotificationOption == _other.directionInformationUsageForActionNotificationOption;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + language.hashCode;
    result = 31 * result + unitSystem.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(includedNotificationTypes);
    result = 31 * result + enableRoundaboutNotification.hashCode;
    result = 31 * result + enableDestinationReachedNotification.hashCode;
    result = 31 * result + enableDoubleNotification.hashCode;
    result = 31 * result + enablePhoneme.hashCode;
    result = 31 * result + notificationFormatOption.hashCode;
    result = 31 * result + streetNameUsageOption.hashCode;
    result = 31 * result + roadNumberUsageOption.hashCode;
    result = 31 * result + signpostDirectionUsageOption.hashCode;
    result = 31 * result + textUsageOptions.hashCode;
    result = 31 * result + enableHighwayExit.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(includedNaturalGuidanceTypes);
    result = 31 * result + directionInformationUsageForActionNotificationOption.hashCode;
    return result;
  }
}


// ManeuverNotificationOptions "private" section, not exported.

final _sdkNavigationManeuvernotificationoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint32, Pointer<Void>, Uint8, Uint8, Uint8, Uint8, Uint32, Uint32, Uint32, Uint32, Pointer<Void>, Uint8, Pointer<Void>, Uint32),
    Pointer<Void> Function(int, int, Pointer<Void>, int, int, int, int, int, int, int, int, Pointer<Void>, int, Pointer<Void>, int)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_create_handle'));
final _sdkNavigationManeuvernotificationoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_release_handle'));
final _sdkNavigationManeuvernotificationoptionsGetFieldlanguage = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_language'));
final _sdkNavigationManeuvernotificationoptionsGetFieldunitSystem = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_unitSystem'));
final _sdkNavigationManeuvernotificationoptionsGetFieldincludedNotificationTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_includedNotificationTypes'));
final _sdkNavigationManeuvernotificationoptionsGetFieldenableRoundaboutNotification = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_enableRoundaboutNotification'));
final _sdkNavigationManeuvernotificationoptionsGetFieldenableDestinationReachedNotification = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_enableDestinationReachedNotification'));
final _sdkNavigationManeuvernotificationoptionsGetFieldenableDoubleNotification = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_enableDoubleNotification'));
final _sdkNavigationManeuvernotificationoptionsGetFieldenablePhoneme = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_enablePhoneme'));
final _sdkNavigationManeuvernotificationoptionsGetFieldnotificationFormatOption = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_notificationFormatOption'));
final _sdkNavigationManeuvernotificationoptionsGetFieldstreetNameUsageOption = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_streetNameUsageOption'));
final _sdkNavigationManeuvernotificationoptionsGetFieldroadNumberUsageOption = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_roadNumberUsageOption'));
final _sdkNavigationManeuvernotificationoptionsGetFieldsignpostDirectionUsageOption = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_signpostDirectionUsageOption'));
final _sdkNavigationManeuvernotificationoptionsGetFieldtextUsageOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_textUsageOptions'));
final _sdkNavigationManeuvernotificationoptionsGetFieldenableHighwayExit = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_enableHighwayExit'));
final _sdkNavigationManeuvernotificationoptionsGetFieldincludedNaturalGuidanceTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_includedNaturalGuidanceTypes'));
final _sdkNavigationManeuvernotificationoptionsGetFielddirectionInformationUsageForActionNotificationOption = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_field_directionInformationUsageForActionNotificationOption'));



Pointer<Void> sdkNavigationManeuvernotificationoptionsToFfi(ManeuverNotificationOptions value) {
  final _languageHandle = sdkCoreLanguagecodeToFfi(value.language);
  final _unitSystemHandle = sdkCoreUnitsystemToFfi(value.unitSystem);
  final _includedNotificationTypesHandle = heresdkNavigationBindingslistofSdkNavigationManeuvernotificationtypeToFfi(value.includedNotificationTypes);
  final _enableRoundaboutNotificationHandle = booleanToFfi(value.enableRoundaboutNotification);
  final _enableDestinationReachedNotificationHandle = booleanToFfi(value.enableDestinationReachedNotification);
  final _enableDoubleNotificationHandle = booleanToFfi(value.enableDoubleNotification);
  final _enablePhonemeHandle = booleanToFfi(value.enablePhoneme);
  final _notificationFormatOptionHandle = sdkNavigationNotificationformatoptionToFfi(value.notificationFormatOption);
  final _streetNameUsageOptionHandle = sdkNavigationLocalizedtextusageoptionToFfi(value.streetNameUsageOption);
  final _roadNumberUsageOptionHandle = sdkNavigationLocalizedtextusageoptionToFfi(value.roadNumberUsageOption);
  final _signpostDirectionUsageOptionHandle = sdkNavigationLocalizedtextusageoptionToFfi(value.signpostDirectionUsageOption);
  final _textUsageOptionsHandle = sdkRoutingTextusageoptionsToFfi(value.textUsageOptions);
  final _enableHighwayExitHandle = booleanToFfi(value.enableHighwayExit);
  final _includedNaturalGuidanceTypesHandle = heresdkNavigationBindingslistofSdkNavigationNaturalguidancetypeToFfi(value.includedNaturalGuidanceTypes);
  final _directionInformationUsageForActionNotificationOptionHandle = sdkNavigationDirectioninformationusageoptionToFfi(value.directionInformationUsageForActionNotificationOption);
  final _result = _sdkNavigationManeuvernotificationoptionsCreateHandle(_languageHandle, _unitSystemHandle, _includedNotificationTypesHandle, _enableRoundaboutNotificationHandle, _enableDestinationReachedNotificationHandle, _enableDoubleNotificationHandle, _enablePhonemeHandle, _notificationFormatOptionHandle, _streetNameUsageOptionHandle, _roadNumberUsageOptionHandle, _signpostDirectionUsageOptionHandle, _textUsageOptionsHandle, _enableHighwayExitHandle, _includedNaturalGuidanceTypesHandle, _directionInformationUsageForActionNotificationOptionHandle);
  sdkCoreLanguagecodeReleaseFfiHandle(_languageHandle);
  sdkCoreUnitsystemReleaseFfiHandle(_unitSystemHandle);
  heresdkNavigationBindingslistofSdkNavigationManeuvernotificationtypeReleaseFfiHandle(_includedNotificationTypesHandle);
  booleanReleaseFfiHandle(_enableRoundaboutNotificationHandle);
  booleanReleaseFfiHandle(_enableDestinationReachedNotificationHandle);
  booleanReleaseFfiHandle(_enableDoubleNotificationHandle);
  booleanReleaseFfiHandle(_enablePhonemeHandle);
  sdkNavigationNotificationformatoptionReleaseFfiHandle(_notificationFormatOptionHandle);
  sdkNavigationLocalizedtextusageoptionReleaseFfiHandle(_streetNameUsageOptionHandle);
  sdkNavigationLocalizedtextusageoptionReleaseFfiHandle(_roadNumberUsageOptionHandle);
  sdkNavigationLocalizedtextusageoptionReleaseFfiHandle(_signpostDirectionUsageOptionHandle);
  sdkRoutingTextusageoptionsReleaseFfiHandle(_textUsageOptionsHandle);
  booleanReleaseFfiHandle(_enableHighwayExitHandle);
  heresdkNavigationBindingslistofSdkNavigationNaturalguidancetypeReleaseFfiHandle(_includedNaturalGuidanceTypesHandle);
  sdkNavigationDirectioninformationusageoptionReleaseFfiHandle(_directionInformationUsageForActionNotificationOptionHandle);
  return _result;
}

ManeuverNotificationOptions sdkNavigationManeuvernotificationoptionsFromFfi(Pointer<Void> handle) {
  final _languageHandle = _sdkNavigationManeuvernotificationoptionsGetFieldlanguage(handle);
  final _unitSystemHandle = _sdkNavigationManeuvernotificationoptionsGetFieldunitSystem(handle);
  final _includedNotificationTypesHandle = _sdkNavigationManeuvernotificationoptionsGetFieldincludedNotificationTypes(handle);
  final _enableRoundaboutNotificationHandle = _sdkNavigationManeuvernotificationoptionsGetFieldenableRoundaboutNotification(handle);
  final _enableDestinationReachedNotificationHandle = _sdkNavigationManeuvernotificationoptionsGetFieldenableDestinationReachedNotification(handle);
  final _enableDoubleNotificationHandle = _sdkNavigationManeuvernotificationoptionsGetFieldenableDoubleNotification(handle);
  final _enablePhonemeHandle = _sdkNavigationManeuvernotificationoptionsGetFieldenablePhoneme(handle);
  final _notificationFormatOptionHandle = _sdkNavigationManeuvernotificationoptionsGetFieldnotificationFormatOption(handle);
  final _streetNameUsageOptionHandle = _sdkNavigationManeuvernotificationoptionsGetFieldstreetNameUsageOption(handle);
  final _roadNumberUsageOptionHandle = _sdkNavigationManeuvernotificationoptionsGetFieldroadNumberUsageOption(handle);
  final _signpostDirectionUsageOptionHandle = _sdkNavigationManeuvernotificationoptionsGetFieldsignpostDirectionUsageOption(handle);
  final _textUsageOptionsHandle = _sdkNavigationManeuvernotificationoptionsGetFieldtextUsageOptions(handle);
  final _enableHighwayExitHandle = _sdkNavigationManeuvernotificationoptionsGetFieldenableHighwayExit(handle);
  final _includedNaturalGuidanceTypesHandle = _sdkNavigationManeuvernotificationoptionsGetFieldincludedNaturalGuidanceTypes(handle);
  final _directionInformationUsageForActionNotificationOptionHandle = _sdkNavigationManeuvernotificationoptionsGetFielddirectionInformationUsageForActionNotificationOption(handle);
  try {
    return ManeuverNotificationOptions._(
      sdkCoreLanguagecodeFromFfi(_languageHandle), 
      sdkCoreUnitsystemFromFfi(_unitSystemHandle), 
      heresdkNavigationBindingslistofSdkNavigationManeuvernotificationtypeFromFfi(_includedNotificationTypesHandle), 
      booleanFromFfi(_enableRoundaboutNotificationHandle), 
      booleanFromFfi(_enableDestinationReachedNotificationHandle), 
      booleanFromFfi(_enableDoubleNotificationHandle), 
      booleanFromFfi(_enablePhonemeHandle), 
      sdkNavigationNotificationformatoptionFromFfi(_notificationFormatOptionHandle), 
      sdkNavigationLocalizedtextusageoptionFromFfi(_streetNameUsageOptionHandle), 
      sdkNavigationLocalizedtextusageoptionFromFfi(_roadNumberUsageOptionHandle), 
      sdkNavigationLocalizedtextusageoptionFromFfi(_signpostDirectionUsageOptionHandle), 
      sdkRoutingTextusageoptionsFromFfi(_textUsageOptionsHandle), 
      booleanFromFfi(_enableHighwayExitHandle), 
      heresdkNavigationBindingslistofSdkNavigationNaturalguidancetypeFromFfi(_includedNaturalGuidanceTypesHandle), 
      sdkNavigationDirectioninformationusageoptionFromFfi(_directionInformationUsageForActionNotificationOptionHandle)
    );
  } finally {
    sdkCoreLanguagecodeReleaseFfiHandle(_languageHandle);
    sdkCoreUnitsystemReleaseFfiHandle(_unitSystemHandle);
    heresdkNavigationBindingslistofSdkNavigationManeuvernotificationtypeReleaseFfiHandle(_includedNotificationTypesHandle);
    booleanReleaseFfiHandle(_enableRoundaboutNotificationHandle);
    booleanReleaseFfiHandle(_enableDestinationReachedNotificationHandle);
    booleanReleaseFfiHandle(_enableDoubleNotificationHandle);
    booleanReleaseFfiHandle(_enablePhonemeHandle);
    sdkNavigationNotificationformatoptionReleaseFfiHandle(_notificationFormatOptionHandle);
    sdkNavigationLocalizedtextusageoptionReleaseFfiHandle(_streetNameUsageOptionHandle);
    sdkNavigationLocalizedtextusageoptionReleaseFfiHandle(_roadNumberUsageOptionHandle);
    sdkNavigationLocalizedtextusageoptionReleaseFfiHandle(_signpostDirectionUsageOptionHandle);
    sdkRoutingTextusageoptionsReleaseFfiHandle(_textUsageOptionsHandle);
    booleanReleaseFfiHandle(_enableHighwayExitHandle);
    heresdkNavigationBindingslistofSdkNavigationNaturalguidancetypeReleaseFfiHandle(_includedNaturalGuidanceTypesHandle);
    sdkNavigationDirectioninformationusageoptionReleaseFfiHandle(_directionInformationUsageForActionNotificationOptionHandle);
  }
}

void sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationManeuvernotificationoptionsReleaseHandle(handle);

// Nullable ManeuverNotificationOptions

final _sdkNavigationManeuvernotificationoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_create_handle_nullable'));
final _sdkNavigationManeuvernotificationoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_release_handle_nullable'));
final _sdkNavigationManeuvernotificationoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationOptions_get_value_nullable'));

Pointer<Void> sdkNavigationManeuvernotificationoptionsToFfiNullable(ManeuverNotificationOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationManeuvernotificationoptionsToFfi(value);
  final result = _sdkNavigationManeuvernotificationoptionsCreateHandleNullable(_handle);
  sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(_handle);
  return result;
}

ManeuverNotificationOptions? sdkNavigationManeuvernotificationoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationManeuvernotificationoptionsGetValueNullable(handle);
  final result = sdkNavigationManeuvernotificationoptionsFromFfi(_handle);
  sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationManeuvernotificationoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationManeuvernotificationoptionsReleaseHandleNullable(handle);

// End of ManeuverNotificationOptions "private" section.


