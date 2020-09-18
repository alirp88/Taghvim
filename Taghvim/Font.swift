//
//  Font.swift
//  Taghvim
//
//  Created by Ali Riahipour on 17.09.20.
//

import SwiftUI

extension Font {
    static func vazir(textStyle: Font.TextStyle) -> Font { // swiftlint:disable:this cyclomatic_complexity
        switch textStyle {
        case .largeTitle:
            return .custom("Samim FD", size: 48, relativeTo: textStyle)
        case .title:
            return .custom("Samim FD", size: 44, relativeTo: textStyle)
        case .title2:
            return .custom("Samim FD", size: 40, relativeTo: textStyle)
        case .title3:
            return .custom("Samim FD", size: 36, relativeTo: textStyle)
        case .headline:
            return .custom("Samim FD", size: 32, relativeTo: textStyle)
        case .subheadline:
            return .custom("Samim FD", size: 28, relativeTo: textStyle)
        case .body:
            return .custom("Samim FD", size: 24, relativeTo: textStyle)
        case .callout:
            return .custom("Samim FD", size: 20, relativeTo: textStyle)
        case .footnote:
            return .custom("Samim FD", size: 16, relativeTo: textStyle)
        case .caption:
            return .custom("Samim FD", size: 12, relativeTo: textStyle)
        case .caption2:
            return .custom("Samim FD", size: 8, relativeTo: textStyle)
        @unknown default:
            return .custom("Samim FD", size: 4, relativeTo: textStyle)
        }
    }
}
