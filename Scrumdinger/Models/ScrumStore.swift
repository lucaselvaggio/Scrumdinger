//
//  ScrumStore.swift
//  Created by Luca Selvaggio on 21/06/24.
//

import Foundation

/* ObservableObject is a class-constrained protocol for connecting external model data to SwiftUI views. */

@MainActor
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
        .appendingPathComponent("scrums.data")
    }
    
    /* Reading from the file system can be slow. To keep the interface responsive, you’ll write an asynchronous function to load data from the file system
       Making the function asynchronous lets the system efficiently prioritize updating the user interface instead of sitting idle and waiting while the file system reads data. */
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        let scrums = try await task.value
        self.scrums = scrums
    }

    /* The difference from 'load()' is that you won’t need to handle a return value from the write operation, but you’ll want to handle errors from saving. */
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
