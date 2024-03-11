import SwiftUI
import SwiftUICharts

struct ContentView: View {
	var body: some View {
		NavigationView{
			ScrollView{
				VStack(alignment: .leading, spacing: 24){
					Text("Overview")
						.font(.title2)
						.bold()
					
					TransactionChart()
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
