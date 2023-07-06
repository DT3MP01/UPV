
function usage {
       printf "Usage:   $0 [<acción>]\n"
       printf " -h           Display this help message.\n"
       exit 0
}

while getopts 'h' flag; do
  case "$flag" in
    h) usage ;;
    \?) usage ;;
    *) usage ;;
  esac
done

for i in `seq $1 $2`;
  do
  ssh $3
done
