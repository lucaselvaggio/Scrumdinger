//
//  ThemePicker.swift
//  Created by Luca Selvaggio on 20/06/24.
//

import SwiftUI

struct ThemePicker: View {

    // This binding communicates changes to the theme within the theme picker back to the parent view.
    @Binding var selection: Theme
    
    var body: some View {
        
        // Theme is conform to CaseIterable so that you can easily access all the enumeration’s cases.
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)       // when a user interacts with a navigation style picker, the system pushes the picker view onto the navigation stack.
    }
}

#Preview {
    ThemePicker(selection: .constant(.app_periwinkle))      /* to create a binding to a hard-coded, immutable value.
                                                           Constant bindings are useful in previews or when prototyping your app’s user interface. */
}
