//
//  ContentViewGadaiElektronik.swift
//  Training Pegadaian batch 1
//
//  Created by Kurniawan Gigih Lutfi Umam on 13/08/20.
//  Copyright © 2020 Pegadaian Digital. All rights reserved.
//

import SwiftUI

struct ContentViewGadaiElektronik: View {
    @State var tipe: String = ""
    @State var harga: String = ""
    @State private var selectionJenis = 0
    @State private var selectionMerek = 0
    @State var text: String = "Multiline \ntext \nis called \nTextEditor"
    @ObservedObject var model = PostViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    VStack {
                        Picker(selection: $selectionJenis, label: Text("Jenis ")) {
                            List(model.data){
                                brand in
                                Text(brand.name).tag(brand.id)
                            }
                        }
                    }
                    VStack {
                        Picker(selection: $selectionMerek, label: Text("Merek ")) {
                            Text("Sharp").tag(1)
                            Text("Toshiba").tag(2)
                            Text("LG").tag(3)
                        }
                    }
                    VStack{
                        HStack{
                            Text("Tipe ")
                            TextField("Ricecooker ABCD", text: $tipe).padding()
                        }
                    }
                    VStack{
                        HStack{
                            Text("Harga Pasar ")
                            TextField("Rp. 1.000.000", text: $harga).padding()
                        }
                    }
                    VStack{
                        HStack{
                            Text("Diskripsi")
                            TextView() {
                                $0.textColor = .black
                                $0.font = .systemFont(ofSize: 16)
                                // Any other setup you like
                            }
                        }
                    }
                    
                }
                Spacer()
                Button(
                    action: {
                        // did tap
                },
                    label: { Text("Selanjutnya").bold() }
                )
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                    .background(Color("HijauTua"))
                    .edgesIgnoringSafeArea(.all)
                
            }
            .navigationBarTitle(Text("Gadai Elektronik"))
        }.accentColor( .white)
    }
}


struct PostView : View {
    @State private var selectionJenisMerek = 0
    @ObservedObject var model = PostViewModel()
    
    var body: some View{
        NavigationView{
            Form{
                Section(header: Text("Merk:")){
                    Picker(selection: $selectionJenisMerek,label : Text("Merek")){
                        List(model.data){
                            brand in
                            Text(brand.name).tag(1)
                        }
                    }
                }
                .navigationBarTitle("Add Recipe")
                .navigationBarItems(trailing :
                    Button(action : {
                        
                    }){
                        Text("Save")
                })
            }
        }
    }
}

struct TextView: UIViewRepresentable {
    
    typealias UIViewType = UITextView
    var configuration = { (view: UIViewType) in }
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIViewType {
        UIViewType()
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Self>) {
        configuration(uiView)
    }
}

struct ContentViewGadaiElektronik_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
