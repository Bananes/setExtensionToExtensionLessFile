#!/bin/bash
for f in /your/path/and/files/*; do
  pot="$(file $f -b --mime-type)";
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  NC='\033[0m'
  echo $f
  echo "${pot}"
  if [[ $f == *.pdf ]] || [[ $f == *.doc ]] || [[ $f == *.rtf ]] || [[ $f == *.odt ]] || [[ $f == *.docx ]]; then
    echo "Has an extension"
  else
    echo "${GREEN}Does not have an extension, we will add one${NC}"
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
      echo "${RED}Error - we will not add extension to this file${NC}"
        ;;
    esac
  fi
done

echo "\n*** Please verify your file ***"
ls

