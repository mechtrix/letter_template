#import "@preview/letter-pro:3.0.0": letter-simple

#let template(
  sender-name: none,
  sender-address: none,
  sender-phone: none,
  sender-email: none,
  sender-email-display: none,
  annotations: none,
  recipient: none,
  tax-number: none,
  date: none,
  subject: none,
  body
) = {
  set text(lang: "de", font: "Lato")

  let real-name = sender-name.replace("--dot-- ", ". ")
  let real-email = sender-email.replace("--at--", "@")
  let real-address = sender-address.replace("--nl--", "\n")
  let months = ("Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember")
  let parts = date.split("-")
  let formatted-date = str(int(parts.at(2))) + ". " + months.at(int(parts.at(1)) - 1) + " " + parts.at(0)

  show: letter-simple.with(
    font: "Lato", 
    sender: (
      name: real-name,
      address: real-address,
      extra: [
      Telefon: #link("tel:+" + sender-phone)[#sender-phone]\
      E-Mail: #link("mailto:" + real-email)[#real-email]\
      ],
    ),
    annotations: annotations,
    recipient: recipient,
    date: formatted-date,
    subject: subject,
    reference-signs: if tax-number != none {(
      ([Steuernummer], [#tax-number]),
    )} else { () },
  )

  body
}
