//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Luca Selvaggio on 20/06/24.
//

import SwiftUI

struct DetailEditView: View {
    
    // @State wrapper because you need to mutate the property from within the view.
    // @State private var scrum = DailyScrum.emptyScrum (old implementation)
    
    /* when a user modifies information about a scrum, multiple screens in the app need to reflect those changes.
       In this section, you’ll add a binding to the edit view that updates the scrum in the detail view when the user taps the Done button .
       > The detail screen shares a source of truth with the edit screen. */
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                
                // the $ syntax to create a binding to scrum.title
                TextField("Title", text: $scrum.title)
                HStack {
                    
                    // passing a step value of 1 limits the user to choosing whole numbers.
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        
                        // the Text view won’t appear onscreen, but VoiceOver uses it to identify the purpose of the slider.
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    
                    /* Because the text label displays the state property and the system automatically updates the views that depend on the state property,
                       the slider and the label stay in sync. */
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)              // all the information that VoiceOver needs is in the accessibility value for the slider.
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { index in
                    scrum.attendees.remove(atOffsets: index)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
