//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Luca Selvaggio on 20/06/24.
//

import SwiftUI

struct ScrumsView: View {
    
    /* the list view also needs to reflect changes a user makes to an individual scrum on the edit screen.
     For this data flow, you need to pass another binding down the view hierarchy. */
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: ()->Void
    
    var body: some View {
        
        if #available(iOS 16.0, *) {
            ScrumsStackView(saveAction: saveAction, scrums: $scrums)
        } else {
            NavigationView {
                ScrumsList(scrums: $scrums, saveAction: saveAction)
            }
        }
        
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
