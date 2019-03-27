identification division.
program-id. cobolapi.

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
01 D0                   pic x(256).
01 D1                   pic x(256).
01 D2                   pic x(256).
01 D3                   pic x(256).
01 C0                   pic x(256).
01 C1                   pic x(256).
01 C2                   pic x(256).
01 C3                   pic x(256).
01 leader               pic x(256).
01 api                  pic x(256).
01 person               pic x(256).
01 person-id            pic x(256).

procedure division.

*> Always send out the Content-type before any other IO
display
   "Content-type: application/json"
   newline
end-display

accept value-string from environment "REQUEST_URI".

*> /api/person/<id>
unstring value-string
delimited by "/"
into
  leader delimiter D0 count C0
  api delimiter D1 count C1
  person delimiter D2 count C2
  person-id delimiter D3 count C3
end-unstring

*> API Router
if person is equal to "people"
    call "person" using by reference person-id.
if value-string is equal to "/api"
    call "root".
if value-string is equal to "/api/towns"
    call "towns".

end program cobolapi.
