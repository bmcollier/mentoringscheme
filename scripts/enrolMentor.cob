identification division.
program-id. enrolMentor.

environment division.
input-output section.
File-Control.
    Select HTMLINPUT assign to 'test.html'
    Access is sequential.

data division.
File Section.

FD HTMLINPUT.

01 HTML-RECORD      Pic x(25600).


working-storage section.
01 newline              pic x     value x'0a'.

01 WS-HTMLFILE          Pic X(25600).

procedure division.
Start-Process.
  Open input HTMLINPUT.
  Read HTMLINPUT at end go to End-Process.
  Move HTML-RECORD to WS-HTMLFILE.
  Display WS-HTMLFILE.

  Go to Start-Process.

End-Process.
end program enrolMentor.
