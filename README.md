<img src="https://github.com/lucaselvaggio/Scrumdinger/assets/102549254/4da2f015-c629-432f-a218-8a6768f40faa">

Useful to learn the essentials of iOS app development by building a fully functional app using SwiftUI, based on Apple Developer Tutorials.

# App features
### Scrum list
<img width="200" height="330" src="https://github.com/lucaselvaggio/Scrumdinger/assets/102549254/4b34677e-d361-410b-8380-a46c52d6860a">

The main screen of the app displays a summary of each of the user’s daily scrums. Users can tap a row in the list to view the details of a scrum or create a new scrum by tapping a button in the navigation bar.

### Scrum detail and edit
<img width="200" height="330" src="https://github.com/lucaselvaggio/Scrumdinger/assets/102549254/be1ad5dd-611d-4eb6-bdcb-07f60314a3c9">

The detail screen shows more information about a scrum, including the name of each attendee and a list of previous meetings. Users can modify any of the scrum’s attributes by tapping a button in the navigation bar. The edit screen includes a picker with which users can change the color theme of each meeting. Tapping a button the top of the list of attributes starts a new meeting timer.

### Meeting timer
<img width="200" height="330" src="https://github.com/lucaselvaggio/Scrumdinger/assets/102549254/6d096a68-9b4f-40cd-8cf2-c7651ae778cf">

The progress bar at the top of the meeting timer shows the elapsed and remaining time for the meeting. The app displays the name of the current speaker in the center of the screen and a button to advance to the next attendee at the bottom of the screen.
Segments in a circular progress ring represent each attendee. When an attendee uses all their time, Scrumdinger plays a “ding” sound and adds a new segment to the ring. The meeting ends when the ring is full.

# Project details
* Create, modify, and combine views to compose app’s user interface using the SwiftUI declarative syntax
* Model to carry data value and properties
* Supplement accessibility data (ex. VoiceOver)
* Use theme and customization of label style for consistent look throughout app
* Use a list to contain rows of data arranged in a single, scrollable column
* Model compliant to the Identifiable and Codable protocols for a more robust way to manage data identity and state
* Navigation hierarchy from a high-level view to a detailed view to be able to manipulate specific data elements
* ForEach that computes views on demand from an underlying collection of data
* @State and @Binding to ensure that user interface reflects the current state of your app’s data and pass this data between screens
* ObservableObject and @Published for identify the properties in the class that need to trigger a UI update when they change
* @StateObject and @ObservedObject wrappers to monitoring an observable object and @EnvironmentObject property wrapper to share or capture an observable object
* @Environment property wrapper, to read a value that the view’s environment stores, such as the view’s presentation mode, scene phase, visibility, or color scheme
* Life cycle methods to control a model that manages the state
* AVFoundation framework to work with audiovisual media on Apple platforms
* Asynchronous functions 
* Persisting data
* Error wrapper structure
* View that conforms to the Shape protocol
