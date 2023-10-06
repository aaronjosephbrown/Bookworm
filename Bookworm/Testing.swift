//
//  Testing.swift
//  Bookworm
//
//  Created by Aaron Brown on 10/7/23.
//

import SwiftUI

struct Testing: View {
    @Environment(\.editMode) private var editMode
    @State private var name = "Maria Ruiz"


    var body: some View {
        NavigationView {
            Form {
                if editMode?.wrappedValue.isEditing == true {
                    TextField("Name", text: $name)
                } else {
                    Text(name)
                }
            }
            .animation(nil, value: editMode?.wrappedValue)
            .toolbar { // Assumes embedding this view in a NavigationView.
                EditButton()
        }
        }
    }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}
