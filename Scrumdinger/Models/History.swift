//
//  History.swift
//  Created by Luca Selvaggio on 21/06/24.
//

import Foundation

/* Adding Codable conformance at app’s model can write methods to load and save scrums.*/

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    var transcript: String?
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee], transcript: String? = nil) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.transcript = transcript
    }
}
