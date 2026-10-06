import SwiftUI

struct StatusFilterView: View{
    @Environment(ProjectTrackerViewModel.self) private var model
    
    var body: some View{
        List{
            ForEach(Status.allCases){
                status in 
                HStack{
                    Button("\(status.description)"){
                       model.toggleStatusFilter(status: status)
                    }
                    Spacer()
                    Image(systemName: model.selectedFilters.contains(where:{ $0 == .status(statusType: status)}) ? "checkmark.circle" : "circle")
                }
            }
            
        }
    }
}
