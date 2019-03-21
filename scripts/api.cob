
*> ***************************************************************
*> Author:    Brian Tiffin, Francois Hiniger
*> Date:      30-Aug-2008, 02-Oct-2013
*> License:   Public Domain
*> Purpose:   Display some GnuCOBOL CGI environment space
*> Tectonics: cobc -x gnucobolcgi.cob
*>  Move gnucobolcgi to the cgi-bin directory as gnucobol.cgi
*>  browse http://localhost/cgi-bin/gnucobol.cgi
*>      or http://localhost/gnucgiform.html
*> ***************************************************************
identification division.
program-id. gnucobolcgi.

environment division.
input-output section.
file-control.
   select webinput assign to KEYBOARD
   file status is in-status.

data division.
file section.
fd webinput.
  01 chunk-of-post     pic x(1024).

working-storage section.
01 in-status            pic 9999.
01 newline              pic x     value x'0a'.
01 value-string         pic x(256).

*> ***************************************************************
procedure division.

*> Always send out the Content-type before any other IO
display
   "Content-type: application/json"
   newline
end-display

accept value-string from environment "REQUEST_URI".

*> Parse root and choose output
if value-string is equal to "/api"
    call "root".
if value-string is equal to "/api/towns"
    call "towns".

end program gnucobolcgi.