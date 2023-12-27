import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGreen800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.green800,
      );
  static get bodyMediumAsapGray800 => theme.textTheme.bodyMedium!.asap.copyWith(
        color: appTheme.gray800,
      );
  static get bodyMediumInterBlack90002 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.black90002.withOpacity(0.35),
        fontSize: 14.fSize,
      );
  static get bodyMediumInterErrorContainer =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodyMediumInterGray50001 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyMediumInterGray5000114 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.gray50001,
        fontSize: 14.fSize,
      );
  static get bodySmallAsapGray600 => theme.textTheme.bodySmall!.asap.copyWith(
        color: appTheme.gray600,
        fontSize: 12.fSize,
      );
  static get bodySmallAsapGray60012 => theme.textTheme.bodySmall!.asap.copyWith(
        color: appTheme.gray600.withOpacity(0.64),
        fontSize: 12.fSize,
      );
  static get bodySmallAsapGray800 => theme.textTheme.bodySmall!.asap.copyWith(
        color: appTheme.gray800,
        fontSize: 10.fSize,
      );
  static get bodySmallAsapGray900 => theme.textTheme.bodySmall!.asap.copyWith(
        color: appTheme.gray900,
        fontSize: 12.fSize,
      );
  static get bodySmallAsapGray90010 => theme.textTheme.bodySmall!.asap.copyWith(
        color: appTheme.gray900,
        fontSize: 10.fSize,
      );
  static get bodySmallAsapGray90011 => theme.textTheme.bodySmall!.asap.copyWith(
        color: appTheme.gray900,
        fontSize: 11.fSize,
      );
  static get bodySmallBebasNeueBlue700 =>
      theme.textTheme.bodySmall!.bebasNeue.copyWith(
        color: appTheme.blue700,
        fontSize: 12.fSize,
      );
  static get bodySmallBlack90002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90002,
      );
  static get bodySmallBlack90002Light => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90002,
        fontSize: 8.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallBlack90002_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90002,
      );
  static get bodySmallInterBlack90002 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.black90002,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallInterOnErrorContainer =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 12.fSize,
      );
  static get bodySmallJostSecondaryContainer =>
      theme.textTheme.bodySmall!.jost.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 12.fSize,
      );
  static get bodySmallRighteousBlack90002 =>
      theme.textTheme.bodySmall!.righteous.copyWith(
        color: appTheme.black90002,
        fontSize: 10.fSize,
      );
  // Headline text style
  static get headlineLargeBlueA200 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.blueA200,
      );
  static get headlineLargeBlueA200_1 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.blueA200,
      );
  static get headlineSmallInterBlack90002 =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: appTheme.black90002,
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );
  static get labelLargeBlack90002 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90002,
      );
  static get labelLargeRobotoMonoBlack90002 =>
      theme.textTheme.labelLarge!.robotoMono.copyWith(
        color: appTheme.black90002,
        fontSize: 13.fSize,
      );
  static get labelMediumBlack90001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black90001,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumMedium => theme.textTheme.labelMedium!.copyWith(
        fontSize: 11.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumOnErrorContainer =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumOnPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleLargeOnErrorContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
  static get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumInterOnErrorContainer =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumInterOnErrorContainer_1 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
  static get titleMediumOnErrorContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get bebasNeue {
    return copyWith(
      fontFamily: 'Bebas Neue',
    );
  }

  TextStyle get asap {
    return copyWith(
      fontFamily: 'Asap',
    );
  }

  TextStyle get urbanist {
    return copyWith(
      fontFamily: 'Urbanist',
    );
  }

  TextStyle get robotoMono {
    return copyWith(
      fontFamily: 'Roboto Mono',
    );
  }

  TextStyle get jost {
    return copyWith(
      fontFamily: 'Jost',
    );
  }

  TextStyle get righteous {
    return copyWith(
      fontFamily: 'Righteous',
    );
  }

  TextStyle get secularOne {
    return copyWith(
      fontFamily: 'Secular One',
    );
  }
}
