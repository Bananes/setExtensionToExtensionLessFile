#!/bin/bash
for f in /your/path/and/files/*; do
  pot="$(file $f -b --mime-type)"
  echo "${pot}"
    case ${pot} in
      "application/pdf")
      mv "$f" "$f.pdf"
        ;;
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
      mv "$f" "$f.docx"
        ;;
      "application/msword")
      mv "$f" "$f.doc"
        ;;
      "text/rtf")
      mv "$f" "$f.rtf"
        ;;
      "application/vnd.oasis.opendocument.text")
      mv "$f" "$f.odt"
        ;;
      *)
      echo "NIET"
        ;;
    esac
done
