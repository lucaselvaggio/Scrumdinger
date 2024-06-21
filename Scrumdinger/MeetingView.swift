//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Luca Selvaggio on 20/06/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack (alignment: .leading){
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            /* SwiftUI has built-in accessibility, so you get accessibility support with little additional work.
                ex. string content in text views is automatically accessible to device features such as VoiceOver. */
            .accessibilityElement(children: .ignore)        // ignore children's accessibility experience
            .accessibilityLabel("Time remaining")           // explicit a label that can represent the elements
            .accessibilityValue("10 minutes")               // group both children elements
            
            Circle()
                .strokeBorder(lineWidth: 24)
            
            HStack {
                Text("Speaker 1 0f 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
            }
            
        }
        .padding()
    }
}



#Preview {
    MeetingView()
}
