identification division.
program-id. router.

data division.
working-storage section.
01 api          pic x(255).
01 person       pic x(255).
01 person-id    pic x(255)  value '1'.

linkage section.
01 value-string pic a(255).

procedure division.

*> API Router
if value-string is equal to "/api"
    call "root".
if value-string is equal to "/api/towns"
    call "towns".

*> /api/person/<id>
*>unstring url
*>delimited by "/"
*>into
*>  api delimiter D1 count C1
*>  person delimiter D2 count C2
*>  person-id delimiter D3 count C3
*>end-unstring

end program router.
