//
//  Colors, Images, Strings, fonts, layout configs, etc.
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

enum SBLocalizationString {
    static let header:LocalizedStringKey = "Header"
    static let joinButton:LocalizedStringKey = "PlanJoinButton"
    static let descriptionLabel1:LocalizedStringKey = "DescriptionLabel-1"
    static let descriptionLabel2:LocalizedStringKey = "DescriptionLabel-2"
}

enum SBFont: String {
    case hiragino = "HiraginoSans-W3"
    case sfpro = "SFProText-Regular"

    func fontSize(_ size: CGFloat) -> Font {
        return Font.custom(self.rawValue, size: size)
    }
}

struct SBLayoutConfiguration {
    struct JoinButton {
        static let width: CGFloat = 350
        static let height: CGFloat = 56
        static let titleSize: CGFloat = 16
        static let cornerRadius: CGFloat = 28.8
        static let borderWidth: CGFloat = 1
    }

    struct ChartView {
        static let barWidth: CGFloat = 48
        static let barHeight: CGFloat = 300
        static let width: CGFloat = 270
        static let height: CGFloat = 378
        static let bottomPadding: CGFloat = 25
        static let annotationSize: CGFloat = 12
        static let iconWidth: CGFloat = 187
        static let iconHeight: CGFloat = 160
        static let xAxisVisibility: Bool = false
        static let yAxisVisibility: Bool = false
    }
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
