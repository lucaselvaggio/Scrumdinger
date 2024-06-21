//
//  Theme.swift
//  Scrumdinger
//
//  Created by Luca Selvaggio on 20/06/24.
//

/* although you’re not creating a view in this section, you add Color properties from the SwiftUI framework.
   SwiftUI treats colors as View instances that you can add directly to a view hierarchy. */

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable{
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    /* the accent color provides a high-contrast complement to the theme’s main color, ensuring your views remain accessible. */
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)     // to work colors must be defined in the Assets
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}
