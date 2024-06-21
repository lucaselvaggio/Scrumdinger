//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Luca Selvaggio on 20/06/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    // @State private var scrums = DailyScrum.sampleData (old version)
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            //ScrumsView(scrums: $scrums)     -> use binding to manipulate 'scums' value, childs must use @Binding wrapper (old version)
            
            ScrumsView(scrums: $store.scrums){
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
