10 REM THE GAME OF STAR LANES - AN INTERSTELLAR COMMERCE GAME
20 REM FOR 2-4 PLAYERS
30 INPUT "HOW MANY PLAYERS (2-4)";P1
40 PRINT CHR$(26) : PRINT : PRINT : PRINT TAB(10);"* S * T * A * R **";
50 PRINT " L * A * N * E * S *"
60 DIM M(10,13),S(5,4),D1(5),S1(5),Q(5)
65 DIM MX$(5),B(10),P$(10),RX(10),CX(10),B1(10)
70 MX$(5)="ERIDANI EXPEDITERS" : FOR I=1 TO 5 : FOR J=1 TO 4 : S(I,J)=0 : NEXT J
75 D1(I)=0 : S1(I)=100 : Q(I)=0 : B(I)=6000 : NEXT I
80 MX$(3)="CAPELLA FREIGHT CO." : MX$(4)="DENEBOLA SHIPPERS"
90 MX$(1)="ALTAIR STARWAYS" : MX$(2)="BETELGEUSE, LTD."
100 L$=".+*ABCDE" : M$="ABCDEFGHIJKL" : FOR I=1 TO 9 : FOR J=1 TO 12
110 IF INT(RND(1)*20)+1<>10 THEN M(I,J)=1 : GOTO 130
120 M(I,J)=3
130 NEXT J,I
140 INPUT "DOES ANYBODY NEED INSTRUCTIONS";R$
150 IF LEFT$(R$,1)="Y" THEN GOSUB 8000
160 FOR I=1 TO P1 : PRINT "PLAYER ";I; : INPUT "WHAT IS YOUR NAME";P$(I)
170 NEXT I : PRINT : PRINT "NOW I WILL DECIDE WHO GOES FIRST..." : PRINT 
180 I=INT(P1*RND(1)+1) : PRINT P$(I);" IS THE FIRST PLAYER TO MOVE."
185 K=0
190 P=I : GOTO 220
200 K=K+1 :IF K=48 THEN 9500
210 P=P+1 :IF P=P1+1 THEN P=1
220 FOR I=1 TO 5
230 RX(I)=INT(9*RND(1)+1) : CX(I)=INT(12*RND(1)+1)
240 FOR I1=I-1 TO 0 STEP-1 :IF RX(I)=RX(I1) AND CX(I)=CX(I1) THEN 230
250 NEXT I1 :IF M(RX(I),CX(I))>1 THEN 230
260 FOR I1=1 TO 5 :IF Q(I1)=0 THEN 340
270 NEXT I1 :IF M(RX(I),CX(I)+1)>3 OR M(RX(I),CX(I)-1)>3 THEN 340
280 IF M(RX(I)+1,CX(I))>3 OR M(RX(I)-1,CX(I))>3 THEN 340
290 A1=M(RX(I),CX(I)+1) : A2=M(RX(I),CX(I)-1)
300 A3=M(RX(I)+1,CX(I)) : A4=M(RX(I)-1,CX(I))
310 IF A1=2 AND A2<4 AND A3<4 AND A4<4 THEN 230
315 IF A2=2 AND A1<4 AND A3<4 AND A4<4 THEN 230
320 IF A3=2 AND A1<4 AND A2<4 AND A4<4 THEN 230
325 IF A4=2 AND A1<4 AND A2<4 AND A3<4 THEN 230
330 IF A1=3 AND A2<4 AND A3<4 AND A4<4 THEN 230
332 IF A2=3 AND A1<4 AND A3<4 AND A4<4 THEN 230
335 IF A3=3 AND A1<4 AND A3<4 AND A4<4 THEN 230
337 IF A4=3 AND A1<4 AND A2<4 AND A3<4 THEN 230
340 NEXT I : GOSUB 1000 : PRINT
345 PRINT P$(P);
350 PRINT ", HERE ARE YOUR LEGAL MOVES FOR THIS TURN:"
360 FOR I=1 TO 5 : PRINT RX(I);MID$(M$,CX(I),1);" /"; : NEXT I : PRINT 
370 INPUT "WHAT IS YOUR MOVE";R$ :IF LEFT$(R$,1)="M" THEN GOSUB 1000 : GOTO 345
372 IF LEFT$(R$,1)="S" THEN GOSUB 1440 : GOTO 345
375 R=VAL(LEFT$(R$,1))
380 C=ASC(RIGHT$(R$,1))-64 : FOR I=1 TO 5 :IF R=RX(I) AND C=CX(I) THEN 400
390 NEXT I : PRINT "THAT SPACE WAS NOT INCLUDED IN THE LIST..." : GOTO 370
400 A1=M(R-1,C) : A2=M(R+1,C) : A3=M(R,C+1) : A4=M(R,C-1)
410 IF A1<=1 AND A2<=1 AND A3<=1 AND A4<=1 THEN M(R,C)=2 : GOTO 800
420 IF A1>3 AND A2>3 AND A2<>A1 THEN GOSUB 1060
430 IF A1>3 AND A3>3 AND A3<>A1 THEN GOSUB 1060
440 IF A1>3 AND A4>3 AND A4<>A1 THEN GOSUB 1060
450 IF A2>3 AND A3>3 AND A3<>A2 THEN GOSUB 1060
460 IF A2>3 AND A4>3 AND A4<>A2 THEN GOSUB 1060
470 IF A3>3 AND A4>3 AND A3<>A4 THEN GOSUB 1060
480 IF A1<4 AND A2<4 AND A3<4 AND A4<4 THEN 660
490 IF M(R,C)>3 THEN 800
500 IF A1>3 THEN I=A1-3
510 IF A2>3 THEN I=A2-3
520 IF A3>3 THEN I=A3-3
530 IF A4>3 THEN I=A4-3
540 Q(I)=Q(I)+1 : S1(I)=S1(I)+100 : M(R,C)=I+3 : GOTO 700
660 FOR I=1 TO 5 :IF Q(I)=0 THEN 680
670 NEXT I:IF M(R,C)<3 THEN M(R,C)=2 : GOTO 800
680 GOSUB 7900 : PRINT "A NEW SHIPPING COMPANY HAS BEEN FORMED!"
690 PRINT "IT'S NAME IS ";MX$(I) : S(I,P)=S(I,P)+5 : Q(I)=1
695 PRINT : PRINT : PRINT : PRINT : PRINT 
700 IF A1=3 THEN S1(I)=S1(I)+500
710 IF A2=3 THEN S1(I)=S1(I)+500
720 IF A3=3 THEN S1(I)=S1(I)+500
730 IF A4=3 THEN S1(I)=S1(I)+500
740 IF A1=2 THEN S1(I)=S1(I)+100 : Q(I)=Q(I)+1 : M(R-1,C)=I+3
750 IF A2=2 THEN S1(I)=S1(I)+100 : Q(I)=Q(I)+1 : M(R+1,C)=I+3
760 IF A3=2 THEN S1(I)=S1(I)+100 : Q(I)=Q(I)+1 : M(R,C+1)=I+3
770 IF A4=2 THEN S1(I)=S1(I)+100 : Q(I)=Q(I)+1 : M(R,C-1)=I+3
780 IF S1(I)>=3000 THEN T1=I : GOSUB 1400
790 M(R,C)=I+3
800 FOR I=1 TO 5 : B(P)=B(P)+INT(.05*S(I,P)*S1(I)) : NEXT I
810 FOR I=1 TO 5 :IF Q(I)=0 THEN 900
820 PRINT "YOUR CURRENT CASH= $";B(P)
830 PRINT "BUY HOW MANY SHARES OF ";MX$(I);" AT $";S1(I) : PRINT TAB(5);
840 PRINT "YOU NOW OWN ";S(I,P);
850 INPUT R3$ :IF LEFT$(R3$,1)="M" THEN R3$="" : GOSUB 1000 : GOTO 830
855 IF LEFT$(R3$,1)="S" THEN R3$="" : GOSUB 1440 : GOTO 830
856 R3=VAL(R3$) : R3$=""
860 IF R3*S1(I)<=B(P) THEN 880
870 PRINT "YOU ONLY HAVE $";B(P);"- TRY AGAIN" : GOTO  830
880 IF R3=0 THEN 900
890 S(I,P)=S(I,P)+R3 : B(P)=B(P)-(R3*S1(I))
900 NEXT I : GOTO  200
1000 PRINT CHR$(26) : PRINT TAB(22);"MAP OF THE GALAXY"
1010 PRINT TAB(21);"*******************"
1020 PRINT TAB(13);"A  B  C  D  E  F  G  H  I  J  K  L"
1030 FOR R2=1 TO 9 : PRINT TAB(9);R2; : FOR C2=1 TO 12 : PRINT " ";
1040 PRINT MID$(L$,M(R2,C2),1);" "; : NEXT C2 : PRINT : NEXT R2
1050 RETURN
1060 F1=A1-3 :IF F1<0 THEN F1=0
1061 F2=A2-3 :IF F2<0 THEN F2=0
1062 F3=A3-3 :IF F3<0 THEN F3=0
1064 F4=A4-3 :IF F4<0 THEN F4=0
1065 T=Q(F1) : T1=F1 :IF Q(F2)>Q(F1) THEN T=Q(F2) : T1=F2
1070 IF Q(F3)>T THEN T=Q(F3) : T1=F3
1080 IF Q(F4)>T THEN T=Q(F4) : T1=F4
1090 IF F1=T1 OR A1<4 THEN 1110
1100 X=F1 : GOSUB 1180
1110 IF F2=T1 OR A2<4 THEN 1130
1120 X=F2 : GOSUB 1180
1130 IF F3=T1 OR A3<4 THEN 1150
1140 X=F3 : GOSUB 1180
1150 IF F4=T1 OR A4<4 THEN 1170
1160 X=F4 : GOSUB 1180
1170 RETURN
1180 GOSUB 7900 : PRINT MX$(X);" HAS JUST BEEN MERGED INTO ";
1190 PRINT MX$(T1);"!" : PRINT "PLEASE NOTE THE FOLLOWING TRANSACTIONS : "
1200 PRINT : PRINT TAB(4);"OLD STOCK = ";MX$(X);"    NEW STOCK = ";
1210 PRINT MX$(T1) : PRINT 
1220 PRINT "PLAYER";TAB(10);"OLD STOCK";TAB(22);"NEW STOCK";TAB(34);
1230 PRINT " TOTAL HOLDINGS";TAB(53);"BONUS PAID"
1240 FOR I=1 TO P1 : PRINT P$(I);TAB(10);S(X,I);TAB(22);INT((.5*S(X,I))+.5);
1250 PRINT TAB(34);S(T1,I)+INT((.5*S(X,I))+.5);
1260 X1=0 : FOR I1=1 TO P1 : X1=X1+S(X,I1) : NEXT I1
1265 PRINT TAB(53);
1270 PRINT " $";INT(10*((S(X,I)/X1)*S1(X))) : NEXT I
1290 FOR I=1 TO P1 : S(T1,I)=S(T1,I)+INT((.5*S(X,I))+.5)
1300 B(I)=B(I)+INT(10*((S(X,I)/X1)*S1(X))) : NEXT I
1310 FOR I=1 TO 9 : FOR J=1 TO 12 :IF M(I,J)=X+3 THEN M(I,J)=T1+3
1315 NEXT J,I
1317 A1=M(R-1,C) : A2=M(R+1,C) : A3=M(R,C+1) : A4=M(R,C-1)
1318 F1=A1-3 :IF F1<0 THEN F1=0
1319 F2=A2-3 :IF F2<0 THEN F2=0
1320 Q(T1)=Q(T1)+Q(X) : S1(T1)=S1(T1)+S1(X) :IF S1(T1)>3000 THEN GOSUB 1400
1321 F3=A3-3 :IF F3<0 THEN F3=0
1322 F4=A4-3 :IF F4<0 THEN F4=0
1340 S1(X)=100 : Q(X)=0 : FOR I=1 TO P1 : S(X,I)=0 : NEXT I
1355 PRINT : PRINT : PRINT : PRINT : PRINT 
1360 M(R,C)=T1+3
1370 RETURN
1400 GOSUB 7900 : PRINT "THE STOCK OF ";
1410 PRINT MX$(T1);" HAS SPLIT 2 FOR 1!" : S1(T1)=INT(S1(T1)/2)
1415 PRINT : PRINT : PRINT : PRINT : PRINT 
1420 FOR I1=1 TO P1 : S(T1,I1)=2*S(T1,I1) : NEXT I1
1430 RETURN
1440 PRINT CHR$(26) : PRINT 
1450 PRINT "STOCK";TAB(30);"PRICE PER SHARE";TAB(50);"YOUR HOLDINGS"
1460 FOR I3=1 TO 5 :IF S1(I3)=100 THEN 1480
1470 PRINT MX$(I3);TAB(30);S1(I3);TAB(50);S(I3,P)
1480 NEXT I3 : RETURN
7900 REM
7910 PRINT TAB(22);"SPECIAL ANNOUNCEMENT!!" : PRINT 
7920 RETURN
8000 PRINT "SORRY, NO DIRECTIONS YET."
8760 RETURN
9500 GOSUB 7900 : PRINT "THE GAME IS OVER - HERE ARE THE FINAL STANDINGS: "
9505 PRINT 
9510 PRINT "PLAYER";TAB(10);"CASH VALUE OF STOCK";TAB(33);"CASH ON HAND ";
9520 PRINT TAB(50);"NET WORTH" : PRINT 
9530 FOR I=1 TO P1 : FOR J=1 TO 5 : D1(I)=D1(I)+(S1(J)*S(J,I)) : NEXT J,I
9540 FOR I=1 TO P1 : PRINT P$(I);TAB(10);"$";D1(I);TAB(33);"$";B(I);
9550 PRINT TAB(50);"$";D1(I)+B1(I) : D1(I)=0 : B1(I)=0 : NEXT I
9560 INPUT "ANOTHER GAME";R$ :IF LEFT$(R$,1)="Y" THEN 70
9999 END