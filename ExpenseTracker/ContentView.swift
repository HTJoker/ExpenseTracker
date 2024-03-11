import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
//    var demo: [Double] = [8, 2, 4, 5, 12, 9, 2]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    let data = transactionListVM.accumalateTransactions()
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        
                        CardView {
                            VStack(alignment: .leading){
                                ChartLabel(totalExpenses.formatted(.currency(code: "GBP")), type: .title, format: "£%.02f")
                                
                                LineChart()
                            }
                            .background(Color.systemBackground)
                            
                        }
                        .data(data)
                        .chartStyle(ChartStyle(
                            backgroundColor: Color.systemBackground,
                            foregroundColor: ColorGradient(Color.iconColor.opacity(0.4), Color.iconColor)
                            
                        ))
                        .frame(height: 300)
                        .background(Color.systemBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: Color.primary.opacity(0.5), radius: 10, x:0, y: 5)
                        
                    }
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.backgroundColor)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.iconColor, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Preview: PreviewProvider{
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View{
        Group{
            ContentView()
            ContentView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        .environmentObject(transactionListVM)
    }
}
