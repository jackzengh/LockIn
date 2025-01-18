import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
                .strikethrough(item.isCompleted, color: .gray)
                .foregroundColor(item.isCompleted ? .gray : .primary)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 4)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "first", isCompleted: false)
    static var item2 = ItemModel(title: "second", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
                .previewLayout(.sizeThatFits)
                .padding()
            
            ListRowView(item: item2)
                .previewLayout(.sizeThatFits)
                .padding()
        }
        
    }
}
