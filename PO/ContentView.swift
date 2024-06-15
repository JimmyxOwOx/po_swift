import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("PO")
                    .font(.system(size: 64))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Text("CREATE YOUR WORTH.")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                NavigationLink(destination: LoginView()) {
                    Text("Log in")
                        .font(.title2)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: SignupView()) {
                    Text("Sign up")
                        .font(.title2)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("")
           // .navigationBarHidden(true)
            //.navigationBarBackButtonHidden(true)
        }
      //  .navigationViewStyle(StackNavigationViewStyle())
      //  .navigationBarBackButtonHidden(true)
    }
}
   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
