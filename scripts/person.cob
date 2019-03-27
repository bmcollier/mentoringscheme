identification division.
program-id. person.

environment division.
input-output section.

data division.
working-storage section.
01 newline              pic x     value x'0a'.

linkage section.
01 person-id    pic x(256).

procedure division using person-id.

  display function concatenate ('{"person-id":"', function trim(person-id), '",')
  display '"name": "bob",'
  display '"age": 35}'.

end program person.
