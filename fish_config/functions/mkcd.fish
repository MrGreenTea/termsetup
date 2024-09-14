function mkcd --wraps=mkdir --argument DIRECTORY
  mkdir $DIRECTORY && cd $DIRECTORY
end
