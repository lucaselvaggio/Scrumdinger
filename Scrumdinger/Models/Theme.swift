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
    case app_bubblegum
    case app_buttercup
    case app_indigo
    case app_lavender
    case app_magenta
    case app_navy
    case app_orange
    case app_oxblood
    case app_periwinkle
    case app_poppy
    case app_purple
    case app_seafoam
    case app_sky
    case app_tan
    case app_teal
    case app_yellow
    
    /* the accent color provides a high-contrast complement to the theme’s main color, ensuring your views remain accessible. */
    var accentColor: Color {
        switch self {
        case .app_bubblegum, .app_buttercup, .app_lavender, .app_orange, .app_periwinkle, .app_poppy, .app_seafoam, .app_sky, .app_tan, .app_teal, .app_yellow: return .black
        case .app_indigo, .app_magenta, .app_navy, .app_oxblood, .app_purple: return .white
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
