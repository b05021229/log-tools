#!/bin/sh
#fireice
#query info main
#Query customer/Subscriber/Account Info
BuildSQL()
{
  if [ ! -z $1 ]&&[ ! -z $2 ]&&[ ! -z $3 ]&&[ ! -z $4 ]; then
    echo "$1 and $2 is no null"
    SQL="SELECT $1  FROM  $2 where $3 = $4;"
    echo $SQL
  fi 
return 0
}
QueryNumService()
   {
    BuildSQL SUBSCRIBERKEY NUMSERVICE SERVICENUMBER $1
   }
QueryNumService $1

