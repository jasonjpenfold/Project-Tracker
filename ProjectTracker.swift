import SwiftUI

@main
struct ProjectTracker: App {
    @State private var model = ProjectTrackerViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
