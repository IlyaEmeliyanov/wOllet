//
//  PaymentView.swift
//  PaymentApp
//
//  Created by Ilya Emeliyanov on 07/05/22.
//

import SwiftUI

struct PaymentView: View {
    
    @State private var promoCode: String = ""
    @State private var showingPopover: Bool = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Avenir", size: 30)!]
    }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Image("Coupon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 375, height: 240)
                    .cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 4, y: 4)
                    .padding(.vertical)
                VStack(alignment: .leading) {
                    HStack() {
                        Text("Card number")
                            .font(.custom("Avenir", size: 16))
                            .fontWeight(.black)
                            .foregroundColor(.black.opacity(0.6))
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Edit")
                                .font(.custom("Avenir", size: 18))
                                .buttonStyle(.borderless)
                                .tint(.accentColor)
                        }
                    }
                    ZStack {
                        Color.backgroundColor
                        HStack {
                            Image("MasterCard")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 40)
                            VStack(alignment: .leading) {
                                Text("Card holder")
                                    .font(.custom("Avenir", size: 16))
                                    .fontWeight(.black)
                                    .foregroundColor(.black.opacity(0.6))
                                Text("Master card ending in *98")
                                    .font(.custom("Avenir", size: 12))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black.opacity(0.6))
                            }
                        }
                    }.cornerRadius(10).frame(maxWidth: .infinity, maxHeight: 80)
                }
                
                VStack(alignment: .leading) {
                    Text("Promo code")
                        .font(.custom("Avenir", size: 16))
                        .fontWeight(.black)
                        .foregroundColor(.black.opacity(0.6))
                    TextField("Enter PROMO code", text: $promoCode)
                        .padding(20).font(.custom("Avenir", size: 18)).foregroundColor(.gray).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }.padding(.vertical)
                
                Spacer()
                
                ZStack {
                    Color.tintColor
                    Button {
                        showingPopover = true
                    } label: {
                        Text("Pay")
                            .font(.custom("Avenir", size: 16))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    }
                    .popover(isPresented: $showingPopover) {
                        VStack(alignment: .center) {
                            Spacer()
                            
                            VStack(alignment: .center) {
                                Text("Transaction finished successfully")
                                    .font(.custom("Avenir", size: 36))
                                    .fontWeight(.medium)
                                    .foregroundColor(.tintColor)
                                    .multilineTextAlignment(.center).padding(.vertical)
                                Text("Thank you for working with us! ✌🏻")
                                    .font(.custom("Avenir", size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            ZStack {
                                Color.tintColor
                                    Button {
                                        showingPopover = false
                                    } label: {
                                        Text("Finish 👋🏻")
                                            .font(.custom("Avenir", size: 16))
                                            .fontWeight(.black)
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(maxWidth: .infinity, maxHeight: 50)
                                    }
                            }.frame(maxWidth: .infinity, maxHeight: 50).clipShape(Capsule())
                        }.padding(.horizontal)
                        
                        
                    }
                }.frame(maxWidth: .infinity, maxHeight: 50).clipShape(Capsule())
            }.padding(.horizontal)
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
