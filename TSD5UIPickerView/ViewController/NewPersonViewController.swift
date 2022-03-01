//
//  NewPersonViewController.swift
//  TSDProject5
//
//  Created by Дмитрий Геращенко on 19.01.2022.
//

import UIKit

final class NewPersonViewController: UIViewController {
    
    private let updateAction: ((Person) -> Void)
        
    init(updateAction: @escaping ((Person) -> Void)) {
        self.updateAction = updateAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cancelButton = UIButton()
    let addButton = UIButton()
    
    let personImage = UIImageView()
    let changeImageLabel = UIButton()
    
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    
    let dateLabel = UILabel()
    let dateTextField = UITextField()
    
    let ageLabel = UILabel()
    let ageTextField = AgeTextField()
    
    let genderLabel = UILabel()
    let genderTextField = GenderTextField()
    
    let instaLabel = UILabel()
    let instaTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .systemBackground
        
        // Setup User Interface
        setupUI()
        
        // Hide keyboard on tap
        self.hideKeyboardOnTap()
    }
    
    override func viewDidLayoutSubviews() {
        nameTextField.setUnderLine()
        dateTextField.setUnderLine()
        ageTextField.setUnderLine()
        genderTextField.setUnderLine()
        instaTextField.setUnderLine()
    }
    
    // MARK:- Setup UI
    
    private func setupUI() {
        setupCancelButton()
        setupAddButton()
        
        setupPersonImage()
        
        setupNameLabel()
        setupNameTextField()
        
        setupDateLabel()
        setupDateTextField()
        
        setupAgeLabel()
        setupAgeTextField()
        
        setupGenderLabel()
        setupGenderTextField()
        
        setupInstaLabel()
        setupInstaTextField()
    }
    // MARK:- configure Navigation Bar Buttons
    
    // MARK: configure cancelButton
    
    private func setupCancelButton() {
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.addTarget(self, action: #selector(moveToPreviosViewController), for: .touchUpInside)
        
        view.addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
    
    // MARK: configure addButton
    
    private func setupAddButton() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    // MARK:- configure person ImageView
    
    private func setupPersonImage() {
        personImage.translatesAutoresizingMaskIntoConstraints = false
        personImage.image = UIImage(systemName: "person")
        
        view.addSubview(personImage)
        
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 20),
            personImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personImage.widthAnchor.constraint(equalToConstant: 100),
            personImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    // MARK: configure nameLabel
    
    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name"
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textColor = .systemTeal
        
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    // MARK: configure nameTextField
    
    private func setupNameTextField() {
        nameTextField.delegate = self
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.keyboardType = .alphabet
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .words
        nameTextField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        nameTextField.borderStyle = .none
        
        view.addSubview(nameTextField)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    // MARK: configure birthdayLabel
    
    private func setupDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "Date"
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        dateLabel.textColor = .systemTeal
        
        view.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            dateLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    // MARK: configure birthdayDatePicker
    
    private func setupDateTextField() {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .date
        picker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.inputView = picker
        dateTextField.placeholder = "Enter birthday date"
        
        let wrappedView = UIView()
        wrappedView.frame = .init(x: 0, y: 0, width: view.bounds.width, height: 44)
        wrappedView.backgroundColor = .systemBackground
        dateTextField.inputAccessoryView = wrappedView
        
        let doneButton = UIButton(type: .system)
        doneButton.setTitle("Done", for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        doneButton.sizeToFit()
        doneButton.addTarget(self, action: #selector(hideKeyboard), for: .touchUpInside)
        doneButton.frame.origin.x = 8
        wrappedView.addSubview(doneButton)
        
        view.addSubview(dateTextField)
        
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 0),
            dateTextField.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            dateTextField.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            dateTextField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    // MARK: configure ageLabel
    
    private func setupAgeLabel() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = "Age"
        ageLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        ageLabel.textColor = .systemTeal
        
        view.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 16),
            ageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            ageLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            ageLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupAgeTextField() {
        let agePicker = UIPickerView()
        agePicker.dataSource = self.ageTextField
        agePicker.delegate = self.ageTextField
        
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.inputView = agePicker
        ageTextField.placeholder = "Years old"
        
        let wrappedView = UIView()
        wrappedView.frame = .init(x: 0, y: 0, width: view.bounds.width, height: 44)
        wrappedView.backgroundColor = .systemBackground
        ageTextField.inputAccessoryView = wrappedView
        
        let doneButton = UIButton(type: .system)
        doneButton.setTitle("Done", for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        doneButton.sizeToFit()
        doneButton.addTarget(self, action: #selector(hideKeyboard), for: .touchUpInside)
        doneButton.frame.origin.x = 8
        wrappedView.addSubview(doneButton)
        
        view.addSubview(ageTextField)
        
        NSLayoutConstraint.activate([
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 0),
            ageTextField.leadingAnchor.constraint(equalTo: ageLabel.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: ageLabel.trailingAnchor),
            ageTextField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    // MARK: configure ageLabel
    
    private func setupGenderLabel() {
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.text = "Sex"
        genderLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        genderLabel.textColor = .systemTeal
        
        view.addSubview(genderLabel)
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 16),
            genderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            genderLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            genderLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupGenderTextField() {
        let genderPicker = UIPickerView()
        genderPicker.dataSource = self.genderTextField
        genderPicker.delegate = self.genderTextField
        
        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        genderTextField.inputView = genderPicker
        genderTextField.placeholder = "Gender"
        
        let wrappedView = UIView()
        wrappedView.frame = .init(x: 0, y: 0, width: view.bounds.width, height: 44)
        genderTextField.inputAccessoryView = wrappedView
        
        let doneButton = UIButton(type: .system)
        doneButton.setTitle("Done", for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        doneButton.sizeToFit()
        doneButton.addTarget(self, action: #selector(hideKeyboard), for: .touchUpInside)
        doneButton.frame.origin.x = 8
        wrappedView.addSubview(doneButton)
        
        view.addSubview(genderTextField)
        
        NSLayoutConstraint.activate([
            genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 0),
            genderTextField.leadingAnchor.constraint(equalTo: genderLabel.leadingAnchor),
            genderTextField.trailingAnchor.constraint(equalTo: genderLabel.trailingAnchor),
            genderTextField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func setupInstaLabel() {
        instaLabel.translatesAutoresizingMaskIntoConstraints = false
        instaLabel.text = "Instagram"
        instaLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        instaLabel.textColor = .systemTeal
        
        view.addSubview(instaLabel)
        
        NSLayoutConstraint.activate([
            instaLabel.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 16),
            instaLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            instaLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            instaLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupInstaTextField() {
        instaTextField.placeholder = "@username"
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showInstaAlert))
        instaTextField.addGestureRecognizer(gesture)
        instaTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(instaTextField)
        
        NSLayoutConstraint.activate([
            instaTextField.topAnchor.constraint(equalTo: instaLabel.bottomAnchor, constant: 0),
            instaTextField.leadingAnchor.constraint(equalTo: genderLabel.leadingAnchor),
            instaTextField.trailingAnchor.constraint(equalTo: genderLabel.trailingAnchor),
            instaTextField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc private func dateTextFieldStartEditing(picker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        dateTextField.text = formatter.string(from: picker.date)
    }
    
    // MARK: Calls everytime when datePicker value changed
    
    @objc private func datePickerChanged(picker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        dateTextField.text = formatter.string(from: picker.date)
    }
    
    // MARK: Call alertController with textfield for instagram useername input
    
    @objc private func showInstaAlert() {
        let instaAlertController = UIAlertController(title: "Enter instagram username", message: "", preferredStyle: .alert)
        // alert textField
        instaAlertController.addTextField { (textField) in
            textField.placeholder = "@username"
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { (alertAction) in
            let usernameTextField = instaAlertController.textFields![0] as UITextField
            if usernameTextField.text != "" {
                self.instaTextField.text = usernameTextField.text
            } else {
                print("Username text field is empty")
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        instaAlertController.addAction(okAction)
        instaAlertController.addAction(cancelAction)
        present(instaAlertController, animated: true, completion: nil)
    }
    
    // MARK:- Validate functions
    
    private func validateName() -> Bool {
        guard let name = nameTextField.text else { return false }
        
        let regEx = "[A-Za-z'`~\\s]{2,64}"
        let test = NSPredicate(format:"SELF MATCHES %@", regEx)
        let result = test.evaluate(with: name)
        return result
    }
    
    private func validateDate() -> Bool {
        guard let date = dateTextField.text else {
            return false
        }
        return !date.isEmpty
    }
    
    private func validateGender() -> Bool {
        guard let gender = genderTextField.text else { return false }
        return !gender.isEmpty
    }
    
    private func validateInsta() -> Bool {
        guard let insta = instaTextField.text else { return false }
        
        let regEx = "[@A-Za-z'`~\\s0-9]{2,64}"
        let test = NSPredicate(format:"SELF MATCHES %@", regEx)
        let result = test.evaluate(with: insta)
        
        return result
    }
    
    private func validPerson() -> Bool {
        return validateName() && validateDate() && validateGender() && validateInsta()
    }
    
    // MARK: Dismiss ViewController
    
    @objc private func moveToPreviosViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Add Button Tapped
    
    @objc private func addButtonTapped() {
        if validPerson() {
            print("User input data is \(validPerson() ? "valid" : "invalid")")
            let newPerson = Person(name: nameTextField.text!, birthdayDate: dateTextField.text!, age: Int(ageTextField.text!)!, gender: genderTextField.text!, insta: instaTextField.text!)
            self.dismiss(animated: true) {
                self.updateAction(newPerson)
            }
        }
    }
}

extension NewPersonViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

