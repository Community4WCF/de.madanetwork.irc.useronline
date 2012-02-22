##############
### Config ###
##############

package require mysqltcl

##################################################################
#### Here Host, User, Name, Password, Number, Channel change! ####
##################################################################

## Database Host ( localhost is Standard)
set dbhost "localhost"

## Database User			
set dbuser "datenbankuser"

## Database Name	
set dbname "datenbankname"

## Database Password	
set dbpwd "datenbankpasswort"

## WCF/WBB Number ( 1_1 is Standard)
set wbbn "1_1" 

## Channel
set chan "#channelname"

####################################################################
#### From here change nothing more / Ab hier nichts mehr ändern ####
####################################################################

putlog "\[LOADED] IRC User Online by MaDa-Network.de @2011"


bind time - "?0 * * * *" ircuseronline
bind time - "*5 * * * *" ircuseronline

proc ircuseronline { min hour day month year } { 
global dbhost dbuser dbname dbpwd wbbn chan

set ops 0 
set halfops 0 
set voice 0 
set none 0 


foreach nickname [chanlist $chan] { 
  if {[isop $nickname $chan]} { 
      set nicknamesops($ops) $nickname
      incr ops 
   } elseif {[ishalfop $nickname $chan]} { 
    set nicknameshalfops($halfops) $nickname
    incr halfops 
   } elseif {[isvoice $nickname $chan]} { 
    set nicknamesvoice($voice) $nickname
      incr voice 
   } else { 
      set nicknamesnone($none) $nickname 
      incr none 
   } 
} 

set db_handle [mysqlconnect -host $dbhost -user $dbuser -db $dbname -password $dbpwd]

set sql "DELETE FROM wbb$wbbn\_irc_useronline WHERE channel = '$chan';"
mysqlsel $db_handle $sql

if { [array exists nicknamesops] } { 
   for {set x 0} {$x < $ops} {incr x} { 
   		set sql "INSERT INTO wbb$wbbn\_irc_useronline (nickname,channel,op,voice) VALUES ('$nicknamesops($x)','$chan','1', '0');"
		mysqlsel $db_handle $sql
   } 
} 

if { [array exists nicknameshalfops] } { 
   for {set x 0} {$x < $halfops} {incr x} { 
   		set sql "INSERT INTO wbb$wbbn\_irc_useronline (nickname,channel,op,voice) VALUES ('$nicknameshalfops($x)','$chan','0', '1');"
		mysqlsel $db_handle $sql
   } 
} 

if { [array exists nicknamesvoice] } { 
   for {set x 0} {$x < $voice} {incr x} { 
   		set sql "INSERT INTO wbb$wbbn\_irc_useronline (nickname,channel,op,voice) VALUES ('$nicknamesvoice($x)','$chan','0', '1');"
		mysqlsel $db_handle $sql
   } 
} 

if { [array exists nicknamesnone] } { 
   for {set x 0} {$x < $none} {incr x} { 
  		set sql "INSERT INTO wbb$wbbn\_irc_useronline (nickname,channel,op,voice) VALUES ('$nicknamesnone($x)','$chan','0', '0');"
		mysqlsel $db_handle $sql
   } 
} 

mysqlendquery $db_handle 
mysqlclose $db_handle 

}