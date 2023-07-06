#!/bin/bash
re='^\b[0-9]\b'
#!/bin/bash

function usage {
       printf "Usage:   $0 [<acción>] [<salidas>]\n"
       printf " -h           Display this help message.\n"
       printf " <acción> :\n"
       printf "     -1: Encender\n"
       printf "     -0: Apagar\n"
       printf " <salidas> :\n"
       printf "     -a: Todas\n"
       printf "     -n x: Salida x\n"
       printf "     -i x: Desde la salida x\n"
       printf "     –f y: Hasta la salida y\n"
       exit 0
}

headless=
accion=
salida=
numeroAccion=
oneExit=
rangeInicio=1
rangeFin=9
string=""
while getopts '10an:i:f:h' flag; do
  case "$flag" in
    1) [ -n "$accion" ] && usage || accion='encender';
    numeroAccion=1;;
    0) [ -n "$accion" ] && usage || accion='apagar';
    numeroAccion=2;;
    a)
       [ -n "$salida" ] && usage || salida='todas' ;;
    n)
       [ -n "$salida" ] && usage || salida='una';
      oneExit=${OPTARG}
      [[ $oneExit =~ $re ]] || usage
      ;;
    i)

    if [ -n "$salida"  ] || [[ "$salida" != "rango" ]]
    then
        salida='rango'
        
        rangeInicio=${OPTARG}
        [[ "$rangeInicio" -le  "$rangeFin" ]]|| usage
        [[ $rangeInicio =~ $re ]]|| usage
        
    else
        usage
    fi;;
    f)
    if [ -n "$salida"  ] || [[ "$salida" != "rango" ]]
    then
        salida='rango'
        rangeFin=${OPTARG}
        [[ $rangeFin =~ $re ]]|| usage
        [[ "$rangeInicio" -le "$rangeFin" ]]|| usage
    else
        usage
    fi;;
    h) usage ;;
    \?) usage ;;
    *) usage ;;
  esac
done

case  "$numeroAccion" in
  1);;
  2);;
  *) usage;;
esac

case "$salida" in
  una)
    echo "Acción a realizar: $accion  bombilla numero $oneExit"
    { printf "practica\ncos\n1\n$oneExit\n$numeroAccion\nyes\n\n\033\0334\n"; } | telnet 158.42.181.26
  ;;
  todas)
    echo "Acción a realizar: $accion  todas las bombillas"
    { printf "practica\ncos\n1\n9\n$numeroAccion\nyes\n\n\033\0334\n"; } | telnet 158.42.181.26
  ;;
  rango)
  echo "Acción a realizar: $accion bombillas desde la $rangeInicio hasta $rangeFin"
    { printf "practica\ncos\n";
    for i in `seq $rangeInicio $rangeFin`
    do
         printf "1\n$i\n$numeroAccion\nyes\n\n\033\033";
    done
    printf "4\n"; } | telnet 158.42.181.26
  ;;
  *)
  usage;;
esac









