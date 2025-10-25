case "$(uname -s)" in
  Linux*)   export _OS_TYPE=linux;;
  Darwin*)  export _OS_TYPE=crapos;;
  *)        export _OS_TYPE=unknown;;
esac
