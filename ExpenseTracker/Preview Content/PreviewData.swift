import Foundation

var transactionPreviewData = Transaction(id: 1, 
                                         date: "24/01/2024", 
                                         institution: "Desjardins",
                                         account: "Visa Desjardin",
                                         merchant: "Apple",
                                         amount: 11.49,
                                         type: "debit",
                                         categoryId: 801,
                                         category: "Software",
                                         isPending: false,
                                         isTransfer: false,
                                         isExpense: true,
                                         isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
