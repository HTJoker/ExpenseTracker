import SwiftUI
import SwiftUICharts


struct TransactionChart: View {
	@EnvironmentObject var transactionListVM: TransactionListViewModel
	var body: some View {
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
	}
}

struct TransactionChart_Preview: PreviewProvider{
	static let transactionListVM: TransactionListViewModel = {
		let transactionListVM = TransactionListViewModel()
		transactionListVM.transactions = transactionListPreviewData
		return transactionListVM
	}()
	static var previews: some View{
		Group{
			TransactionChart()
			ContentView()
				.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
		}
		.environmentObject(transactionListVM)
	}
}

