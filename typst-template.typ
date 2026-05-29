#import "@preview/letter-pro:3.0.0": letter-simple

#let template(
  sender-name: none,
  sender-address: none,
  sender-phone: none,
  sender-email: none,
  annotations: none,
  recipient: none,
  tax-number: none,
  date: none,
  subject: none,
  body
) = {
  set text(lang: "de")

  show: letter-simple.with(
    sender: (
      name: sender-name,
      address: sender-address,
      extra: [
        Telefon: #link("tel:+" + sender-phone)[#sender-phone]\
        E-Mail: #link("mailto:" + sender-email)[#sender-email]\
      ],
    ),
    annotations: annotations,
    recipient: recipient,
    reference-signs: (
      ([Steuernummer], [#tax-number]),
    ),
    date: date,
    subject: subject,
  )

  body
}