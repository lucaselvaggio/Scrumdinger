//
//  ScrumsView.swift
//  Created by Luca Selvaggio on 20/06/24.
//

import SwiftUI

struct ScrumsView: View {
    
    /* The list view also needs to reflect changes a user makes to an individual scrum on the edit screen.
     For this data flow, you need to pass another binding down the view hierarchy. */
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            /* The List needs a way to identify individual items in the collection (id: ...)
             DailyScrum is conform to the Identifiable protocol for a more robust way to communicate identity.
             Use binding to access to array and single scrum. */
            List($scrums){ $scrum in
                /*  Each row pushes to an individual destination.
                 The Text view acts as a placeholder until you create the detail screen in the next section. */
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }){
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView) {
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            
            //  To monitor the operational state of the app, and save user data when the value changes to inactive
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
        
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
