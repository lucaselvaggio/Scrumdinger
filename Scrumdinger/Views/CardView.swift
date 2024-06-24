//
//  CardView.swift
//  Created by Luca Selvaggio on 20/06/24.
//

import SwiftUI

/* CardView will summarize the DailyScrum model data and display the title, the number of participants, and the duration. */

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader) // This modifier helps convey the information architecture of the view by reading the scrum title, followed by “heading”.
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                
                Spacer()
                
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .padding(.trailing, 20)
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .frame(height: 60)
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

#Preview {
    CardView(scrum: DailyScrum.sampleData[0])
}
