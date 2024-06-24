//
//  SpeakerArc.swift
//  Created by Luca Selvaggio on 24/06/24.
//

import SwiftUI


/* You’ll base the number of arc segments on the number of total speakers.
   The speaker index indicates which attendee is speaking and how many segments to draw.*/
struct SpeakerArc: Shape {

    let speakerIndex: Int
    
    // Calculate the degrees of a single arc
    let totalSpeakers: Int
    
    // Calculate the value using degreesPerSpeaker and speakerIndex
    private var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeakers)
    }
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    
    // Returns the ending angle using the startAngle and degreesPerSpeaker
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
    
    // The Shape protocol requires a path(in:) function
    func path(in rect: CGRect) -> Path {
        
        // For the circle of the arc
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
