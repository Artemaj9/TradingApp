//
//  Timer.swift
//  CryptoTestApp
//
//  Created by Artem on 22.10.2023.
//

//import SwiftUI
//
//struct Timer: View {
//    
//    @State var min: Int = 0
//    @State var sec: Int = 0
//    @State var time = ""
//    @State var timer: Timer? = nil
//    
//    var body: some View {
//        
//        NavigationView{
//            VStack{
//                TextField("Tempo (min o mm:ss)", text: $time)
//                
//                HStack{
//                    
//                    Button(action: {
//                        self.start()
//                        self.time = String(self.min)+":"+String(self.sec)
//                        
//                    }){
//                        Text("Start")
//                    }
//                    Button(action: {
//                        self.stop()
//                        
//                    }){
//                        Text("Stop")
//                    }
//                }
//            }//VStack
//        }//NavigationView
//    }//body
//    func start(){
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
//            temp in
//            self.sec = self.sec + 1
//            if(self.sec == 59){
//                self.sec = 0
//                self.min = self.min + 1
//            }
//        }
//    }
//    
//    func stop(){
//        timer?.invalidate()
//        timer = nil
//    }
//    func updateTimeString() {
//        self.time = String(format: "%02d:%02d", self.min, self.sec)
//    }
//
//    func start(){
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { temp in
//            self.sec = self.sec + 1
//            if self.sec == 59 {
//                self.sec = 0
//                self.min = self.min + 1
//            }
//            updateTimeString()
//        }
//    }
//}
//
//struct Timer_Previews: PreviewProvider {
//    static var previews: some View {
//        Timer()
//    }
//}
