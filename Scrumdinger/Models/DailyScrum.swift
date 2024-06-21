//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Luca Selvaggio on 20/06/24.
//

import Foundation

/* Because DailyScrum will primarily carry value data, you’ll make it a value type by declaring it as a struct. */

struct DailyScrum : Identifiable, Codable {
    let id: UUID                    // to identify the item uniquely
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        
        /* By using a computed property, you can provide a getter to retrieve the scrum’s length as a double value and a setter to update the corresponding integer value when the slider changes. */
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id: UUID                // Scrum attendees could have the same name
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}

extension DailyScrum {
    /* that provides some sample data. */
    static let sampleData: [DailyScrum] = [
        DailyScrum(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
            lengthInMinutes: 10,
            theme: Theme.yellow
        ),
        DailyScrum(
            title: "App Dev",
            attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
            lengthInMinutes: 5,
            theme: Theme.orange
        ),
        DailyScrum(
            title: "Web Dev",
            attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
            lengthInMinutes: 5,
            theme: Theme.poppy
        )
    ]
}
