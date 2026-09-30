import SwiftUI


struct ProjectListView: View{
    @Environment(ProjectTrackerViewModel.self) private var model
    
    var body: some View{
        List{
            EditButton()
            ForEach(model.projectStorage.projectDatabase){
                project in
                
                cardView(project: project)
                    .contentShape(Rectangle())
                    .onTapGesture{
                        model.path.append(project)
                    }
                    
                }.onDelete{offsets in 
                model.deleteProject(at: offsets)
                
            }
            .onMove{ source, destination in
                model.moveProject(source: source, destination: destination)
            }
            
            
        }
    }
    
    private struct cardView: View{
        let project: Project
        var body: some View{
            LazyVStack(alignment: .leading, spacing: 10){
                cardText(project: project)
                    
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 200)
            .background{cardBackground}
            
            
            
        }
        private var cardBackground: some View{
            Color(red: 0.8, green: 0.9, blue: 1.0)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5, x: -5, y: 10)
                
                
                
        }
    }
    private struct cardText: View{
        let project: Project
        var body: some View{
            
            
                Text("\(project.name)")
                .font(.title)
                .bold()
            
            
                
                Text("\(project.language)")
                .monospaced()
            
            Text("\(project.description)")
            Text("Status: \(project.status)")
            Text("Started: \(project.dateStarted.formatted(date: .abbreviated, time: .shortened))")
            Text("Last: \(project.lastWorkedOn.formatted(date: .abbreviated, time: .shortened))")
            Text("Notes: \(project.notes)")
            Text("\(project.favourite ? "❤️" : " ")")
            
                    }
    }
    
        
}


