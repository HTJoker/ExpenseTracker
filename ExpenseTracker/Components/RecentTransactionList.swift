import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack{
            HStack{
                Text("Recent Transaction")
                    .bold()
                
                Spacer()
                
                NavigationLink{
                    TransactionList()
                } label: {
                    HStack(spacing: 4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.textColor)
                }
            }
            .padding(.top)
            
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element){index, transactions in
                TransactionRow(transaction: transactions)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.5), radius: 10, x:0, y: 5)
    }
}

struct RecentTransactionList_Preview: PreviewProvider{
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View{
        Group{
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        .environmentObject(transactionListVM)
    }
}
