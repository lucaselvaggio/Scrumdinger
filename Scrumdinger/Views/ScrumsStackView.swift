//
//  ScrumsStackView.swift
//  Scrumdinger
//
//  Created by Luca Selvaggio on 21/06/24.
//

import SwiftUI

@available(iOS 16.0, *)
struct ScrumsStackView: View {
    let saveAction: ()->Void
    
    @Binding var scrums: [DailyScrum]
    var body: some View {
        
        /* From the NavigationStack container view, you can traverse a stack of views in a hierarchy. */
        NavigationStack {
            ScrumsList(scrums: $scrums, saveAction: saveAction)
        }
    }
}

#Preview {
    ScrumsStackView(saveAction: {}, scrums: .constant(DailyScrum.sampleData))
}
