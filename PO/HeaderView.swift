import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("PO")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .padding(.leading)

            Spacer()

            HStack(spacing: 10) {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.trailing)
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .padding()
        }
        
        .padding(.top, -1) // 根据需要调整顶部填充
       // .padding(.bottom, 10)
        .background(Color.white)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
