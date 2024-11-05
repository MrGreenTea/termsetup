function backup --docstring "Rename a file to <filename>.BACKUP" --argument-names "filename"
  mv "$filename" "$filename".BACKUP
end
