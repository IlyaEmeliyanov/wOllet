//
//  ContentView.swift
//  PaymentApp
//
//  Created by Ilya Emeliyanov on 07/05/22.
//

import SwiftUI

struct ContentView: View {
    
    // Types declaration
    struct PaymentMethod {
        var title: String
        var isAvailable: Bool
    }
    
    let paymentMethods: [PaymentMethod] = [
        PaymentMethod(title: "Paypal", isAvailable: true),
        PaymentMethod(title: "Credit", isAvailable: false),
        PaymentMethod(title: "Wallet", isAvailable: true),
    ]
    
    @State private var selectedPaymentMethod: PaymentMethod = PaymentMethod(title: "", isAvailable: false)
    @State private var cardNumber: String = ""
    @State private var monthYear: String = ""
    @State private var cvvNumber: String = ""
    @State private var isToggle : Bool = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Avenir", size: 30)!]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Total price")
                            .font(.custom("Avenir", size: 16))
                            .fontWeight(.black)
                            .foregroundColor(.black.opacity(0.6))
                        Text("$2,280.0")
                            .font(.custom("Avenir", size: 45))
                            .fontWeight(.bold)
                            .foregroundColor(.tintColor)
                    }.padding(.vertical).frame(maxHeight: 70)
                    
                    VStack(alignment: .leading) {
                        Text("Payment method")
                            .font(.custom("Avenir", size: 16))
                            .fontWeight(.black)
                            .foregroundColor(.black.opacity(0.6))
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(0..<paymentMethods.count, id: \.self) { i in
                                    ZStack(alignment: .leading) {
                                        Color.tintColor
                                        HStack(alignment: .center, spacing: 0) {
                                            Button {
                                                selectedPaymentMethod = self.paymentMethods[i]
                                            } label: {
                                                Text("\(paymentMethods[i].title)")
                                                    .foregroundColor(.white)
                                                    .font(.custom("Avenir", size: 18))
                                                    .fontWeight(.bold)
                                                    .frame(width: 100, height: 30)
                                                Image(systemName: paymentMethods[i].isAvailable ? "checkmark.circle" : "xmark.circle")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 24, weight: .semibold))
                                            }
                                        }.padding(.horizontal, 5)
                                    }.cornerRadius(10).opacity(paymentMethods[i].title == selectedPaymentMethod.title ? 1.0 : 0.5)
                                }
                            }
                        }.frame(maxHeight: 70).onAppear() {
                            self.selectedPaymentMethod = self.paymentMethods[0]
                        }
                    }.padding(.vertical, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Card number")
                            .font(.custom("Avenir", size: 16))
                            .fontWeight(.black)
                            .foregroundColor(.black.opacity(0.6))
                        ZStack {
                            Color.white
                            HStack(alignment: .center) {
                                Image("MasterCard")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 40)
                                SecureField("Enter your name", text: $cardNumber)
                                    .padding(20).font(.custom("Avenir", size: 18)).foregroundColor(.gray)
                            }.padding(.horizontal)
                        }.cornerRadius(10).frame(maxHeight: 80)
                    }.padding(.vertical)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Valid until")
                                .font(.custom("Avenir", size: 16))
                                .fontWeight(.black)
                                .foregroundColor(.black.opacity(0.6))
                            ZStack {
                                Color.white
                                TextField("Month/Year", text: $monthYear)
                                    .padding(20).font(.custom("Avenir", size: 18)).foregroundColor(.gray)
                            }.cornerRadius(10).frame(maxHeight: 60)
                        }
                        VStack(alignment: .leading) {
                            Text("CVV")
                                .font(.custom("Avenir", size: 16))
                                .fontWeight(.black)
                                .foregroundColor(.black.opacity(0.6))
                            ZStack {
                                Color.white
                                SecureField("CVV", text: $cvvNumber)
                                    .padding(20).font(.custom("Avenir", size: 18)).foregroundColor(.gray)
                            }.cornerRadius(10).frame(maxHeight: 60)
                        }
                    }.padding(.vertical)
                    
                    HStack {
                        Toggle(isOn: $isToggle) {
                            Text("Save card for future payments")
                                .font(.custom("Avenir", size: 16))
                                .fontWeight(.black)
                                .foregroundColor(.black.opacity(0.6))
                        }.tint(.tintColor)
                    }.padding(.vertical)
                    
                    NavigationLink(destination: PaymentView()) {
                    ZStack {
                        Color.tintColor
                        Text("Proceed to confirm")
                            .font(.custom("Avenir", size: 16))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .padding()
                        }.frame(maxWidth: .infinity, maxHeight: 50).clipShape(Capsule()).padding(.vertical)
                    }
                    
                }.padding()
            }.navigationTitle(Text("Payment data"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Color {
    static let backgroundColor = Color("BackgroundColor")
    static let tintColor = Color("TintColor")
}
