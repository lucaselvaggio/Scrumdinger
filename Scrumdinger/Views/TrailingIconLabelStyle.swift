//
//  TrailingIconLabelStyle.swift
//  Created by Luca Selvaggio on 20/06/24.
//

import SwiftUI

/* With the LabelStyle protocol, you can create a consistent design throughout your app by reusing the same label style for several views. */

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

/* Adding an extension on LabelStyle creates a static property named 'trailingIcon'. */

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
