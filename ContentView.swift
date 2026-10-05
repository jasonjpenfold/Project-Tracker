import SwiftUI

struct ContentView: View {
    @Environment(ProjectTrackerViewModel.self) internal var model
    
    var body: some View {
        TabView{
            Tab("Projects", systemImage: "folder"){
                navigation
            }
            Tab("Filters", systemImage:  "line.3.horizontal.decrease.circle"){
                filters
            }
        }.tabViewStyle(.sidebarAdaptable)
            
        
    }
}
