//
//  Colors, Images, Strings, etc.
//

import SwiftUI

enum SBColors: String, CaseIterable {
    case SBButtonBlue = "SBButtonBlue"
    case SBBlueLight = "SBBlueLight"
    case SBBlueDark = "SBBlueDark"
    case SBPurple = "SBPurple"
    case SBTextBlueLight = "SBTextBlueLight"
    case SBTextBlueDark = "SBTextBlueDark"
}

enum SBImages: String, CaseIterable {
    case SBRobot = "SBRobotIcon"
}

extension Color {
    static let sbPurple = Color(SBColors.SBPurple.rawValue)
    static let sbButtonBlue = Color(SBColors.SBButtonBlue.rawValue)
    static let sbBlueDark = Color(SBColors.SBBlueDark.rawValue)
    static let sbBlueLight = Color(SBColors.SBBlueLight.rawValue)
    static let sbTextBlueDark = Color(SBColors.SBBlueDark.rawValue)
    static let sbTextBlueLight = Color(SBColors.SBBlueLight.rawValue)
}

extension Image {
    static let sbRobot = Image(SBImages.SBRobot.rawValue)
}
