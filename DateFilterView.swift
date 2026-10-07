import SwiftUI

struct DateFilterView: View{
    @Environment(ProjectTrackerViewModel.self) private var model
    @State private var dateRange: DateRange = .all
    var body: some View{
        
        
        HStack{
            Text("Date Started")
            Spacer()
            VStack{
                ForEach(DateRange.allCases){
                    range in 
                    Button(range.description)
                    {
                        model.toggleDateStartedFilter(dateRange: range)
                    }.padding()
                }
            }
        }.padding()
    }
}
