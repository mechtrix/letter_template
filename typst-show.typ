#show: template.with(
$if(sender-name)$  sender-name: "$sender-name$",
$endif$
$if(sender-address)$  sender-address: "$sender-address$",
$endif$
$if(sender-phone)$  sender-phone: "$sender-phone$",
$endif$
$if(sender-email)$  sender-email: "$sender-email$",
$endif$
$if(annotations)$  annotations: "$annotations$",
$endif$
$if(recipient)$  recipient: [
$recipient$
  ],
$endif$
$if(tax-number)$  tax-number: "$tax-number$",
$endif$
$if(date)$  date: "$date$",
$endif$
$if(subject)$  subject: "$subject$",
$endif$
)