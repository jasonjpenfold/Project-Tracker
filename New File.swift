import SwiftUI


struct ProjectListView: View{
    @Environment(ProjectTrackerViewModel.self) private var model
    
    var body: some View{
        List{
            ForEach(model.projectStorage.projectDatabase){
                project in
                Text("\(project)")
            }
        }
    }
}
