node(sofia,plovdiv,125).
node(plovdiv,staraZagora,90).
node(staraZagora,kazanlak,30).
node(karlovo,kazanlak,50).
node(staraZagora,sliven,100).
node(sliven,aitos,80).
node(aitos,burgas,20).
node(sofia,vidin,206).
node(varna,burgas,120).
node(sofia,pernik,20).
node(sofia,karlovo,120).
node(sofia,pleven,162).
node(pleven,ruse,119).
node(pleven,velikoTyrnovo,120).
node(velikoTyrnovo,shumen,140).
node(ruse,silistra,109).
node(staraZagora,haskovo,40).
node(shumen,varna,89).
node(varna,dobrich,50).
node(haskovo,svilengrad,74).
node(kazanlak,velikoTyrnovo,84).
node(velikoTyrnovo,silistra,200).
node(svilengrad,sliven,140).
node(kazanlak,sliven,100).
node(sliven,velikoTyrnovo,100).
node(aitos,varna,100).
node(velikoTyrnovo,ruse,100).
node(shumen,dobrich,120).
node(velikoTyrnovo,levski,60).
node(pleven,levski,60).
node(karlovo,troyan,60).
node(troyan,pleven,70).
node(karlovo,plovdiv,60).

path(A, B, [B, A], C) :- node(A, B, C) ; node(B, A ,C).
path(A, B, [B|Ps], Cost) :-
     node(C, B, Cost1),
     path(A, C, Ps, Cost0),
     Cost is Cost0 + Cost1.

result( Place1, Place2, Path, Cost) :-
     order_by([asc(Cost)],
              ( path(Place1, Place2, Path0, Cost),
                reverse(Path0, Path) )),!.
result( Place2, Place1,Path0, Cost) :-
     order_by([asc(Cost)],
              ( path(Place1, Place2, Path0, Cost))),!.