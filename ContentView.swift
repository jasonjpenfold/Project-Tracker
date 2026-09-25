import SwiftUI

struct ContentView: View {
    @Environment(ProjectTrackerViewModel.self) private var model
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                header
                
                
            }
            Spacer()
            trackerBody
            Spacer()
            footer
            Spacer()
            
            
                    }
    }
}

extension ContentView{
    private var header: some View{
        Text("Project Tracker")
    }
    
    private var trackerBody: some View{
        
        ProjectListView()
    }
    
    private var footer: some View{
        Text("The footer")
    }
}
