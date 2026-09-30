import SwiftUI

struct ContentView: View {
    @Environment(ProjectTrackerViewModel.self) private var model
    
    var body: some View {
        @Bindable var model = model
        
        NavigationStack(path: $model.path){
            VStack {
                Spacer()
                header
                Spacer()
                trackerBody
                Spacer()
                footer
                Spacer()
                
                
            }
            .navigationDestination(for: String.self){
                value in 
                if value == "AddView"{
                    let newProject = model.createEmptyProject()
                    AddView(newProject: newProject)
                }
            }
            // contentview owns navigationstack
            .navigationDestination(for: Project.self){
                project in 
                
                EditView(editProject: project)
                
                
            }
            
            .toolbar{
                ToolbarItem{
                    Button{
                        model.path.append("AddView")
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Home")
        .padding()
        
        
    }
}

extension ContentView{
    private var header: some View{
        VStack{
            
            Text("Project Tracker")
                .font(.title.monospaced().bold())
            
        }
            }
    
    private var trackerBody: some View{
        
        ProjectListView()
    }
    
    private var footer: some View{
        Text("The footer")
    }
}
