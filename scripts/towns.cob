identification division.
program-id. towns.

environment division.
input-output section.

data division.
working-storage section.
01 newline              pic x     value x'0a'.

procedure division.


display
   '{"name": 1, "age": 2, "sex": 3}'
end-display.

end program towns.
