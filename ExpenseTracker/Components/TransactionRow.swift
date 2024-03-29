import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
	var transaction: Transaction
	var body: some View {
		HStack(spacing: 20){
			RoundedRectangle(cornerRadius: 20, style: .continuous)
				.fill(Color.iconColor.opacity(0.3))
				.frame(width: 44, height: 44)
				.overlay{
					FontIcon.text(.awesome5Solid(code: transaction.icon),
								  fontsize: 24, color: Color.iconColor)
				}
			
			VStack(alignment: .leading, spacing: 6){
				Text(transaction.merchant)
					.font(.subheadline)
					.bold()
					.lineLimit(1)
				
				Text(transaction.category)
					.font(.footnote)
					.opacity(0.7)
					.lineLimit(1)
				
				Text(transaction.dateParsed, format: .dateTime.year().month().day())
					.font(.footnote)
					.foregroundColor(.secondary)
			}
			Spacer()
			Text(transaction.signedAmount, format: .currency(code: "GBP"))
				.bold()
				.foregroundColor(transaction.type == TransactionType.credit.rawValue ? 
								 Color.textColor : .primary)
		}
		.padding([.top, .bottom], 8)
	}
}

struct TransactionRow_Preview: PreviewProvider{
	static var previews: some View{
		TransactionRow(transaction: transactionPreviewData)
		TransactionRow(transaction: transactionPreviewData)
			.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
		
	}
}
