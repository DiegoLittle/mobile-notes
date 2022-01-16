//
//  NewEntryView.swift
//  Journal
//
//  Created by Diego Little on 10/16/21.
//

import SwiftUI

struct NoteView: View {
//    print(note)
//    var myNote:NoteListItem?;
    @State private var showSheet:Bool = false;
    @State private var showImagePicker:Bool = false;
    @State private var sourceType: UIImagePickerController.SourceType = .camera;
    @State private var image: UIImage? 
    
    @ObservedObject var noteViewModel = NoteViewModel()
    

//    Pass in the note to update the viewmodel on load
//    If its a new note then initalize it with defaults
    
    
    var body: some View {
        VStack{
            TextField("Title", text: $noteViewModel.note.title)
                .font(.title)

                .padding(20)
            ;
            TextEditor(text: $noteViewModel.note.description)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                .font(.body)
//            Image(uiImage: image ?? UIImage(named:"placeholder")!)
//                .resizable()
//                .frame(width:300,height:300)
//            TextField("Text", text: $noteViewModel.note.description)
//                .padding(20)
        }
        Button("Choose Picture"){
            self.showSheet = true
        }.actionSheet(isPresented: $showSheet){
            ActionSheet(title: Text("Select Photo"),
            message: Text("Choose"),
                        buttons:[
                            .default(Text("Show Library")){
                                self.showImagePicker = true;
                                self.sourceType = .photoLibrary
                            },
                            .default(Text("Camera")){
                                self.showImagePicker = true;
                                self.sourceType = .camera
                            }
                        ])
        }.sheet(isPresented: $showImagePicker){
            ImagePicker(image: self.$image,isShown: self.$showImagePicker,  sourceType: self.sourceType)
        }
        Button("Submit",
               action:{
            noteViewModel.postNote()
        })
    }
}

struct NewEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
