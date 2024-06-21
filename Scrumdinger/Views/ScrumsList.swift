//
//  ScrumsList.swift
//  Scrumdinger
//
//  Created by Luca Selvaggio on 21/06/24.
//

import SwiftUI

struct ScrumsList: View {
    @Environment(\.scenePhase) private var scenePhase
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    let saveAction: () -> Void
    
    var body: some View {
        
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
        
        //  to monitor the operational state of the app, and save user data when the value changes to inactive
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

#Preview {
    ScrumsList(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
