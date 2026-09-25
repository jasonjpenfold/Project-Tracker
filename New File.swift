import SwiftUI


struct ProjectListView: View{
    @Environment(ProjectTrackerViewModel.self) private var model
    
    var body: some View{
        List{
            ForEach(model.projectStorage.projectDatabase){
                project in
                Text("\(project)")
                
                cardView(project: project)
            }
        }
    }
}

extension ProjectListView{
    private struct cardView: View{
        let project: Project
        var body: some View{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .opacity(0.2)
                    .shadow(radius: 5, x:-5, y: 10)
                    .overlay{
                        cardText(project: project)
                    }
            }.frame(height: 200)
                    }
            }
    private struct cardText: View{
        let project: Project
        var body: some View{
            VStack(alignment: .leading){
                Text("\(project.name)")
                Text("\(project.language)")
            }
                    }
    }
}


