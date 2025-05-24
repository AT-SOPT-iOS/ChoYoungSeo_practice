
import SwiftUI

struct ItemView: View {

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(1...20, id: \.self) { index in
                    VStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.orange)
                            .frame(height: 80)

                        Text("아이템 \(index)")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                }
            }
            .padding()
        }
        .background(Color.white)
    }
}

#Preview {
    ItemView()
}
