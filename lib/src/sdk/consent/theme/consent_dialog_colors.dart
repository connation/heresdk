// Copyright (c) 2023 HERE Global B.V. and its affiliate(s).
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

import 'package:flutter/material.dart';

@immutable
class ConsentDialogColors extends ThemeExtension<ConsentDialogColors> {
  const ConsentDialogColors({
    required this.text,
    required this.background,
    required this.learnMoreLink,
    required this.acceptButtonCaption,
    required this.acceptButtonPrimary,
    required this.acceptButtonSecondary,
    required this.rejectButtonCaption,
    required this.rejectButtonPrimary,
    required this.rejectButtonBorder,
  });

  final Color? text;
  final Color? background;
  final Color? learnMoreLink;
  final Color? acceptButtonCaption;
  final Color? acceptButtonPrimary;
  final Color? acceptButtonSecondary;
  final Color? rejectButtonCaption;
  final Color? rejectButtonPrimary;
  final Color? rejectButtonBorder;

  static ConsentDialogColors here(Brightness brightness) {
    bool isLightMode = brightness == Brightness.light;
    return ConsentDialogColors(
      text: isLightMode ? Colors.black : Colors.white,
      background: isLightMode ? Colors.white : Colors.black,
      learnMoreLink: const Color.fromARGB(255, 0x28, 0x7e, 0xf7),
      acceptButtonCaption: Colors.white,
      acceptButtonPrimary: const Color.fromARGB(255, 0x80, 0xaa, 0xff),
      acceptButtonSecondary: const Color.fromARGB(255, 0x7d, 0xe6, 0xe1),
      rejectButtonCaption: isLightMode ? Colors.black : Colors.white,
      rejectButtonPrimary: isLightMode ? Colors.white : Colors.black,
      rejectButtonBorder: isLightMode ? Colors.black12 : Colors.white54,
    );
  }

  @override
  ConsentDialogColors copyWith({
    Color? text,
    Color? background,
    Color? learnMoreLink,
    Color? acceptButtonCaption,
    Color? acceptButtonPrimary,
    Color? acceptButtonSecondary,
    Color? rejectButtonCaption,
    Color? rejectButtonPrimary,
    Color? rejectButtonBorder,
  }) {
    return ConsentDialogColors(
      text: text ?? this.text,
      background: background ?? this.background,
      learnMoreLink: learnMoreLink ?? this.learnMoreLink,
      acceptButtonCaption: acceptButtonCaption ?? this.acceptButtonCaption,
      acceptButtonPrimary: acceptButtonPrimary ?? this.acceptButtonPrimary,
      acceptButtonSecondary: acceptButtonSecondary ?? this.acceptButtonSecondary,
      rejectButtonCaption: rejectButtonCaption ?? this.rejectButtonCaption,
      rejectButtonPrimary: rejectButtonPrimary ?? this.rejectButtonPrimary,
      rejectButtonBorder: rejectButtonBorder ?? this.rejectButtonBorder,
    );
  }

  @override
  ConsentDialogColors lerp(ConsentDialogColors? other, double t) {
    if (other is! ConsentDialogColors) {
      return this;
    }
    return ConsentDialogColors(
      text: Color.lerp(text, other.text, t),
      background: Color.lerp(background, other.background, t),
      learnMoreLink: Color.lerp(learnMoreLink, other.learnMoreLink, t),
      acceptButtonCaption: Color.lerp(acceptButtonCaption, other.acceptButtonCaption, t),
      acceptButtonPrimary: Color.lerp(acceptButtonPrimary, other.acceptButtonPrimary, t),
      acceptButtonSecondary: Color.lerp(acceptButtonSecondary, other.acceptButtonSecondary, t),
      rejectButtonCaption: Color.lerp(rejectButtonCaption, other.rejectButtonCaption, t),
      rejectButtonPrimary: Color.lerp(rejectButtonPrimary, other.rejectButtonPrimary, t),
      rejectButtonBorder: Color.lerp(rejectButtonBorder, other.rejectButtonBorder, t),
    );
  }
}
