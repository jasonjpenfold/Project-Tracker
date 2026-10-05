import SwiftUI


struct ProjectListView: View{
    @Environment(ProjectTrackerViewModel.self) private var model
    
    var body: some View{
        @Bindable var model = model
        List{
            
            ForEach(model.currentList){
                project in
                
                VStack{
                    
                    
                    CardView(project: project)
                        .contentShape(Rectangle())
                        .onTapGesture{
                            model.path.append(project)
                        }
                    HStack{
                        CardButtons(model: model, projectId: project.id)
                    }
                    
                }
                }
            
           
             // onmove only works if not filtering or sorting
            .onMove(perform: model.canMove ? model.moveProject : nil)
            
             
            // ondelete and onmove work on individual rows so put on ForEach
            .onDelete{offsets in 
                model.deleteProject(at: offsets)
                
            }
            
        }
        //searchable works on whole list so put on List
        .searchable(text: $model.searchText, placement: .automatic)
    }
    
    private struct CardView: View{
        
        let project: Project
        var body: some View{
            VStack(alignment: .leading, spacing: 10){
                CardText(project: project)
                    
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
    private struct CardText: View{
        
        let project: Project
        
        var body: some View{
            
            
                Text("\(project.name)")
                .font(.title2.monospaced())
                .bold()
            
            
                
                Text("\(project.language)")
                .monospaced()
                .foregroundColor(.blue)
            
            Text("\(project.description)")
            Text("Status: \(project.status)")
            Text("Started: \(project.dateStarted.formatted(date: .abbreviated, time: .shortened))")
                .font(.headline)
            HStack{
                Text("Last: \(project.lastWorkedOn.formatted(date: .abbreviated, time: .shortened))")
                    .font(.headline)
                Spacer()
                
            }
                        Text("Notes: \(project.notes)")
            HStack{
                Spacer()
                Text("\(project.favourite ? "❤️" : "⚪️")")
            }
                        
                    }
    }
    private struct CardButtons: View{
        let model: ProjectTrackerViewModel
        let projectId: UUID
        @State private var markedAsWorkedOn = false
        
        var body: some View{
            HStack{
                Button("Worked on"){
                    markedAsWorkedOn = model.markAsWorkedOn(projectId: projectId)
                }.buttonStyle(.glass)
                .foregroundStyle(markedAsWorkedOn ? .red : .blue)
                Button("Favourite"){
                    model.markAsFavourite(projectId: projectId)
                }.buttonStyle(.glass)
            }
        }
    }
        
}


