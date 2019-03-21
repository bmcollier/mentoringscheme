identification division.
program-id. root.

environment division.
input-output section.

data division.
working-storage section.
01 newline              pic x     value x'0a'.

procedure division.

display
   '{"name": "john", "age": 31, "sex": "male", "data":"'
   '"}'
end-display.

end program root.
