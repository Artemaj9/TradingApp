//
//  TradeView.swift
//  CryptoTestApp
//
//  Created by Artem on 20.10.2023.
//

import SwiftUI
import Combine

struct TradeView: View {
    
  //  @State var pair: String = "GPB/USD"
    @State var selectedId: Int = 3
    @State var investment = 1000
    @State var balance = 10000
    //@State var timeText: String = "00:12"
    @State var utcTime: String = "1123"
    @State private var keyboardHeight: CGFloat = 0
    @StateObject var vm = TradeViewModel()
    @StateObject var model = Model2()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgmain")
                    .ignoresSafeArea()
                VStack {
                    Text("Trade")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.top, 16)
                    ZStack {
                        
                        Rectangle()
                            .cornerRadius(12)
                            .foregroundColor(Color("graybalance"))
                            .frame(width: .infinity, height: 63)
                            .padding(.horizontal, 36)
                            .padding(.top, 12)
                            .padding(.bottom, 8)
                        
                        
                        VStack {
                            Text("Balance")
                                .font(.body)
                                .padding(.bottom, 3)
                            Text("\(balance)")
                                .fontWeight(.black)
                        }
                        
                        .foregroundColor(.white)
                    }
                    .background(
                        Color("bgmain")
                    )
                    .zIndex(1)
                    ZStack {
                        WebView(shouldRefresh: model.shouldRefresh)
                            .opacity(vm.pair == "RUB/USD" ? 1 : 0)
                        WebView2()
                            .opacity(vm.pair == "RUB/USD" ? 0 : 1)
                            .scaleEffect(y: 1.1)
                    }
                        .zIndex(0.4)
                        .offset(x: -20)
                    
                    VStack {
                        NavigationLink(destination: CurrencyPairView(text: $vm.pair, selectedId: $selectedId, vm: vm)) {
                            ZStack {
                                Rectangle()
                                    .cornerRadius(12)
                                    .foregroundColor(Color("graybalance"))
                                
                                    .frame(height: 63)
                                Text(vm.pair)
                                    .foregroundColor(.white)
                                HStack {
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .scaleEffect(1.2)
                                        .foregroundColor(.white)
                                        .offset(x: -20)
                                }
                            }
                        }
                        HStack {
                            ZStack {
                                Rectangle()
                                    .cornerRadius(12)
                                    .foregroundColor(Color("graybalance"))
                                VStack {
                                    Text("Timer")
                                        .font(.body)
                                        .foregroundColor(Color("greytxt"))
                                        .offset(y: 0)
                                    HStack {
                                        Button {
                                            for item in vm.cancellables {
                                                item.cancel()
                                            }
                                            if vm.textToSeconds(text: vm.timeText) > 10 {
                                                vm.timeText = vm.changetime(x: -10)
                                                vm.timerFlag = false
                                                vm.setUpTimer()
                                            } else {
                                                vm.timeText = "00:00"
                                                vm.timerFlag = true
                                            }
                                            reload()
                                            
                                            
                                        } label: {
                                            Image(systemName: "minus.circle")
                                                .foregroundColor(Color("greytxt"))
                                                .padding(.leading, 12)
                                        }
                                        .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
                                        
                                        
                                        Spacer()
                                        SearchBarView(timeText: $vm.timeText,
                                                      vm: vm,placeholder: "", backgroundColor: Color("graybalance"))
                                        .onTapGesture {
                                            reload()
                                        }
                                        .onSubmit {
                                            reload()
                                        }
                                        
                                        .offset(x: 30)
                                        .foregroundColor(.white)
                                        
                                        Spacer()
                                        Button {
                                            for item in vm.cancellables {
                                                item.cancel()
                                            }
                                            vm.timerFlag = true
                                            vm.timeText = vm.changetime(x: 10)
                                            vm.timerFlag = false
                                            vm.setUpTimer()
                                            reload()
                                        } label: {
                                            Image(systemName: "plus.circle")
                                                .foregroundColor(Color("greytxt"))
                                                .padding(.trailing, 12)
                                        }
                                    }
                                    .offset(y: -6)
                                }
                                
                            }
                            
                            ZStack {
                                Rectangle()
                                    .cornerRadius(12)
                                    .foregroundColor(Color("graybalance"))
                                VStack {
                                    Text("Investment")
                                        .font(.body)
                                        .foregroundColor(Color("greytxt"))
                                    // .offset(y: -8)
                                    HStack {
                                        Button {
                                            
                                        } label: {
                                            Image(systemName: "minus.circle")
                                                .foregroundColor(Color("greytxt"))
                                                .padding(.leading, 12)
                                                .onTapGesture {
                                                    if investment > 0 {
                                                        investment -= 100
                                                    }
                                                    reload()
                                                }
                                        }
                                        Spacer()
                                        BalanceBarView(timeText: $investment, placeholder: "", backgroundColor: Color("graybalance"))
                                            .offset(x: 30)
                                            .foregroundColor(.white)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Button {
                                        } label: {
                                            Image(systemName: "plus.circle")
                                                .foregroundColor(Color("greytxt"))
                                                .padding(.trailing, 12)
                                                .onTapGesture {
                                                    if investment >= 0 && investment <= balance - 100 {
                                                        investment += 100
                                                    }
                                                }
                                        }
                                    }
                                    .offset(y: -6)
                                }
                            }
                            //
                        }
                        .padding(.bottom, 8)
                        .frame(height: 74)
                        HStack {
                            Button {
                                
                            } label: {
                                ZStack(alignment: .topLeading) {
                                    Rectangle()
                                        .cornerRadius(12)
                                        .foregroundColor(Color("redSell"))
                                    Text("Sell")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .fontWeight(.medium)
                                        .padding([.vertical, .leading])
                                }
                                .onTapGesture {
                                    balance += investment
                                    vm.showAlert = true
                                }
                            }
                            Button {
                                
                            } label: {
                                ZStack(alignment: .topLeading) {
                                    Rectangle()
                                        .cornerRadius(12)
                                        .foregroundColor(Color("btn"))
                                    Text("Buy")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .fontWeight(.medium)
                                        .padding([.vertical, .leading])
                                }
                                .onTapGesture {
                                    if balance >= investment {
                                        balance -= investment
                                        vm.showAlert = true
                                    }
                                }
                            }
                        }
                        .frame(height: 63)
                        
                    }
                    .frame(width: .infinity)
                    .padding(36)
                    .padding(.vertical, -12)
                    .background(
                        Color("bgmain")
                    )
                    .offset(y: -90)
                    .zIndex(1)
                    .padding(.bottom, -keyboardHeight/3.5)
                    // 3.
                    .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0
                        if $0 == CGFloat(0) {
                            for item in vm.cancellables {
                                item.cancel()
                            }
                            self.vm.timerFlag = false
                            self.vm.setUpTimer()
                        }
                    }
                    
                }
                .offset(y: 20)
                
                
                
                //.ignoresSafeArea()
                // .background(
                //Color("bgmain");)
                
                if vm.showAlert {
                    CustomAlertView(
                        title: "Successfully!",
                        description: "",
//                        cancelAction: {
//                            // Cancel action here
//                            withAnimation {
//                                vm.showAlert.toggle()
//                            }
//                        },
//                        cancelActionTitle: "Don't Allow",
                        primaryAction: {
                            // Primary action here
                         
                            withAnimation {
                                vm.showAlert.toggle()
                            }
                        },
                        primaryActionTitle: "OK"
                    )
                }
            }
        }
        .onAppear {
            vm.setUpTimer()
        }
      
    }
    
    func reload() {
        model.shouldRefresh.send(true)
    }
}

//extension TradeView {
    class Model2: ObservableObject {
        var shouldRefresh = CurrentValueSubject<Bool, Never>(false)
    }
//}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView()
    }
}
