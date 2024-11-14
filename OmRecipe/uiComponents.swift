//
//  uiComponents.swift
//  MAD9137-SwiftRecipe
//
//  Created by Dat Nguyen(Mike) on 2024-10-26.
//
import SwiftUI

// TextINPUT-----------------START
struct TextInput: View {
    var label: String
    var placeholder: String
    @Binding var text: String
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.bottom, 2)
                .padding(.horizontal)

            HStack(alignment: .center) {
                TextField(placeholder, text: $text)
                    .focused($isFocused)
                    .onChange(of: text) { newValue in
                        print("Current text input: \(newValue)")
                    }
                    .textFieldStyle(CustomTextFieldStyle(isFocused: isFocused))
                    .padding(.vertical, 5)
            }
            .padding(.horizontal)
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    var isFocused: Bool

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 5)
                .stroke(isFocused ? Color.black : Color.gray, lineWidth: 1))
    }
}

// TextINPUT-----------------END

// IngredientListView-----------------START
struct IngredientListView: View {
    @Binding var ingredients: [String]
    @State private var newIngredient: String = ""
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                TextInput(label: " ", placeholder: "Add ingredient", text: $newIngredient)
                Button(action: {
                    if !newIngredient.isEmpty {
                        ingredients.append(newIngredient)
                        newIngredient = ""
                        isExpanded = true
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }
                .padding(.leading, 0)
                .padding(.trailing)
                .offset(y: 8)
            }

            Button(action: {
                isExpanded.toggle()
            }) {
                HStack {
                    Text("Ingredients:")
                        .font(.subheadline)
                        .foregroundColor(Color.black)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.up")
                        .foregroundColor(Color.black)
                }
                .padding(.horizontal)
            }

            if isExpanded {
                VStack {
                    ForEach(ingredients.indices, id: \.self) { index in
                        HStack {
                            Text(ingredients[index])
                                .font(.body)
                            Spacer()
                            Button(action: {
                                ingredients.remove(at: index) // Delete action
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// IngredientListView-----------------END

// StepsListView-----------------START
struct StepsListView: View {
    @Binding var steps: [String]
    @State private var newStep: String = ""
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                TextInput(label: " ", placeholder: "Add a new step...", text: $newStep)
                Button(action: {
                    if !newStep.isEmpty {
                        steps.append(newStep)
                        newStep = ""
                        isExpanded = true
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }
                .padding(.trailing)
                .offset(y: 8)
            }

            Button(action: {
                isExpanded.toggle()
            }) {
                HStack {
                    HStack { Text("Steps:")
                        .font(.subheadline)
                        .foregroundColor(Color.black)
                        Spacer()
                        Image(systemName: isExpanded ? "chevron.down" : "chevron.up")
                            .foregroundColor(Color.black)
                    }
                }

                .padding(.horizontal)
            }

            if isExpanded {
                VStack {
                    ForEach(steps.indices, id: \.self) { index in
                        HStack {
                            Text(steps[index])
                                .font(.body)
                            Spacer()
                            Button(action: {
                                steps.remove(at: index)
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// StepsListView-----------------END

// TimeInputView-----------------START
struct TimeInputView: View {
    @Binding var timeValue: Int
    var label: String

    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Stepper(value: $timeValue, in: 0 ... 1440, step: 1) {
                Text("\(timeValue) mins")
            }
        }
        .padding(.horizontal)
    }
}

// TimeInputView-----------------END

// ChipView-----------------START
struct ChipView: View {
    var label: String

    var body: some View {
        Text(label)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .fill(Color.gray.opacity(0.2))
            )
    }
}

// ChipView-----------------END
