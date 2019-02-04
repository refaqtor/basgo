120 PRINT"*************  Q U E S T  *******************
130 PRINT:PRINT:PRINT
140 PRINT"  YOU WERE WALKING THROUGH THE WOODS ONE DAY AND YOU
150 PRINT"CAME ACROSS THE ENTRANCE OF A CAVE, COVERED WITH BRUSH.
160 PRINT
170 PRINT"  PEOPLE SAY THAT MANY YEARS AGO A PIRATE HID HIS
180 PRINT"TREASURE IN THESE WOODS,  BUT NO ONE HAS EVER FOUND IT.
190 PRINT"IT MAY STILL BE HERE,  FOR ALL I KNOW.
200 REM THIS PROGRAM WAS TAKEN FROM THE JULY 1979 BYTE MAG.
210 REM BY LEE DUSBABEK FOR THE FAMOUS SKIP HANSON (WB6YMH)
400 READ M9,T1,T2
500 DIM W(42),M(6,42)
520 FOR I=1 TO M9
530 READ N
540 IF I=N THEN 570
550 PRINT"DATABASE PROBLEM"I,N
560 STOP
570 FOR J=1 TO 6
580 READ M(J,I)
590 NEXT J
600 NEXT I
900 PRINT
905 PRINT"WHEN YOU ANSWER A QUESTION, I LOOK AT ONLY
906 PRINT"THE FIRST LETTER, ALTHOUGH YOU CAN TYPE IN
907 PRINT"THE WHOLE WORD IF YOU WANT TOO.
920 GOSUB 7500
1000 REM
1010 N=5
1020 M0=0
1030 M6=0
1040 T=T1
1050 P=0
1060 P1=0
1070 FOR J=1 TO M9
1080 W(J)=0
1090 NEXT J
1100 PRINT
1120 GOSUB 8000
1400 REM
1420 M0=M0+1
1440 GOSUB 6000
1460 GOSUB 2000
1480 GOSUB 4000
1500 IF T>0 THEN 1400
1510 IF N<>5 THEN 1400
1710 GOSUB 3000
1720 PRINT
1730 PRINT" CONGRATULATIONS!!   YOU GOT THE TREASURE
1740 PRINT"OUT IN";M0;
1750 PRINT"MOVES AND YOU GOT"S+10"POINTS!"
1760 PRINT"WANT TO HUNT AGAIN?";
1770 A$="YN"
1771 A2=2
1780 GOSUB 5000
1790 ON A1 GOTO 1000,9999,1760
2000 REM
2100 IF T<>N THEN RETURN
2110 IF T<0 THEN RETURN
2120 IF M6+5>M0 THEN RETURN
2200 PRINT"  DO YOU WANT TO TAKE IT WITH YOU";
2210 A$="YN"
2220 A2=2
2230 GOSUB 5000
2240 ON A1 GOTO 2300,2400
2250 PRINT"WELL?....."
2260 GOTO 2210
2300 T=-1
2310 PRINT
2320 PRINT"OK, LETS GET OUT OF HERE!"
2330 RETURN
2400 PRINT
2410 PRINT"WE'LL LEAVE IT HERE AND YOU CAN EXPLORE SOME MORE."
2430 M6=M0
2440 RETURN
3000 REM
3020 S=0
3030 IF T=-1 THEN S=S+5
3040 IF P=1 THEN S=S+10
3050 FOR J=2 TO M9
3060 S=S+W(J)
3070 NEXT J
3080 RETURN
4000 REM
4020 IF N=T2 THEN RETURN
4030 IF P=1 THEN RETURN
4040 IF T1=T2 THEN RETURN
4050 IF T<>-1 THEN RETURN
4070 IF N=16 THEN P=160
4090 IF P1>0 THEN P1=P1+1
4100 IF N=3 THEN P1=P1+1
4120 IF P1<15 THEN RETURN
4130 PRINT
4140 PRINT"SUDDENLY THE PIRATE LEAPS OUT OF THE
4150 PRINT"GLOOM AND GRABS THE TREASURE FROM YOU!
4160 PRINT"'HAH!', HE SHOUTS, 'YOU FOUND MY
4170 PRINT"TREASURE, DID YOU?!   WELL, I'LL HIDE
4180 PRINT"IT BETTER THIS TIME!'"
4190 PRINT"AND HE DISAPPEARS INTO THE DARKNESS
4200 PRINT"WITH THE TREASURE.
4210 P=1
4220 T=T2
4230 RETURN
5000 REM
5070 INPUT Q$
5090 Q$=LEFT$(Q$,1)
5120 FOR A1=1 TO A2
5121 IF Q$=MID$(A$,A1,1) THEN RETURN
5140 NEXT A1
5150 A1=A2+1
5160 RETURN
6000 REM
6030 N9=N
6050 N8=0
6070 GOSUB 7000
6090 IF N=1 THEN 6120
6100 N0=N
6110 A0=A1
6120 PRINT
6130 I=M(A1,N)
6200 IF I=-2 THEN I=N9
6210 IF D<>0 THEN PRINT"DEBUG";N;"TO";I
6220 IF I<500 THEN 6300
6240 I=I-500
6250 FOR J=0 TO 100
6260 NEXT J
6270 GOTO 6200
6300 ON I/100 GOTO 6340,6370
6320 N=I
6330 GOTO 6400
6340 REM
6350 N=I-100
6355 IF T=-1 THEN N=N+1
6360 GOTO 6400
6370 REM
6380 N=I-200
6390 IF T=-1 THEN N=N+P
6400 IF N<>1 THEN 6500
6420 FOR J=1 TO 6
6430 M(J,N)=2
6440 NEXT J
6450 M(7-A0,N)=N0
6500 REM
6510 IF N8<>2 THEN GOSUB 8000
6530 W(N)=1
6540 N8=N
6600 IF M(1,N)<>-2 THEN 6800
6660 I=M(6,N)
6670 J=-1
6680 IF M(4,N)>100*RND(0) THEN I=M(5,N)
6690 J=-1
6700 IF M(2,N)>100*RND(0) THEN I=M(3,N)
6710 IF D<>0 THEN PRINT"   DEBUG BOUNCE TO";I
6730 GOTO 6200
6800 RETURN
7000 REM
7100 PRINT
7110 PRINT"                      WHICH WAY";
7120 A$="NEUDWSP"
7130 A2=7
7140 GOSUB 5000
7150 IF A1<8 THEN 7300
7160 PRINT"WHICH WAY PO YOU WANT TO GO?"
7180 GOSUB 7500
7200 GOSUB 8000
7210 GOTO 7100
7300 IF A1<7 THEN 7400
7320 GOSUB 3000
7330 PRINT"YOU HAVE"S"POINTS!"
7350 GOTO 7100
7400 RETURN
7500 REM
7520 PRINT
7530 PRINT"TYPE N,S,E,W, U   OR D  FOR NORTH, SOUTH,"
7550 PRINT"EAST, WEST, UP OR DOWN.  TYPE P FOR SCORE"
7560 PRINT
7570 RETURN
8000 REM
8050 I=INT(N/5)
8060 J=N-5*I+1
8100 ON I+1 GOTO 8200,8210,8220,8230,8240,8250,8260,8270,8280,8290
8200 ON J GOTO 9000,9010,9020,9030,9040
8210 ON J GOTO 9050,9060,9070,9080,9090
8220 ON J GOTO 9100,9110,9120,9130,9140
8230 ON J GOTO 9150,9160,9170,9180,9190
8240 ON J GOTO 9200,9210,9220,9230,9240
8250 ON J GOTO 9250,9260,9270,9280,9290
8260 ON J GOTO 9300,9310,9320,9330,9340
8270 ON J GOTO 9350,9360,9370,9380,9390
8280 ON J GOTO 9400,9410,9420,9430,9440
8290 ON J GOTO 9450,9460,9470,9480,9490
8400 IF T<>N THEN 8500
8410 PRINT
8420 PRINT"  THE TREASURE IS HERE!!!!"
8500 IF T<>T2 THEN 8600
8510 IF T1=T2 THEN 8600
8520 IF T1<>N THEN 8600
8530 PRINT
8540 PRINT"A NOTE ON THE WALL SAYS PIRATES NEVER LEAVE
8550 PRINT"THEIR TREASURE TWICE IN THE SAME PLACE!"
8600 RETURN
9000 REM
9003 DATA 42,23,12
9010 DATA 1,0,0,0,0,0,0
9011 PRINT"YOU'RE AT A DEAD END!"
9012 GOTO 8400
9020 DATA 2,-2,101,-2,0,0,0
9021 PRINT"YOU CAN'T GO IN THAT DIRECTION"
9022 PRINT
9023 GOTO 8400
9030 DATA 3,33,2,1,10,106,4
9031 PRINT"A TUNNEL GOES NORTH-SOUTH."
9032 PRINT"THERE IS AN OPENING TO THE WEST.
9037 GOTO 8400
9040 DATA 4,3,30,2,11,2,1
9041 PRINT"YOU'RE ON THE BRINK OF A PIT.
9047 GOTO 8400
9050 DATA 5,8,8,15,10,8,16
9051 PRINT"YOU'RE OUTSIDE THE CAVE.
9052 PRINT"GO SOUTH TO ENTER.
9053 GOTO 8400
9060 DATA 6,16,3,2,10,2,2
9061 PRINT"YOU'RE AT THE HOME OF THE GNOME-KING.
9062 PRINT"FORTUNATELY, HE'S GONE FOR THE DAY.
9067 GOTO 8400
9070 DATA 7,-2,101,-2,0,0,0
9071 PRINT"THE GNOME KING IS HERE!
9072 PRINT"YOU'D BETTER GET OUT!
9073 PRINT
9077 GOTO 8400
9080 DATA 8,18,18,15,10,18,9
9081 PRINT"YOU'RE LOST IN THE WOODS.
9087 GOTO 8400
9090 DATA 9,-2,33,5,1,0,-2
9097 GOTO 8400
9100 DATA 10,-2,101,-2,0,0,0
9101 PRINT"YOU'RE NOT GOING TO GET FAR, DIGGING
9102 PRINT"THROUGH ROCK.
9103 PRINT
9104 GOTO 8400
9110 DATA 11,1,13,4,2,1,2
9111 PRINT"YOU'RE AT THE BOTTOM OF A PIT. A LITTLE
9112 PRINT"STREAM FLOWS OVER THE ROCKS HERE.
9113 GOTO 8400
9120 DATA 12,36,2,1,2,1,2
9121 PRINT"YOU'RE AT A DEAD END!
9122 GOTO 8400
9130 DATA 13,2,37,2,1,11,14
9131 PRINT"YOU'RE AT A WIDE SPOT.  THERE IS A SOOTY PATCH
9132 PRINT"WHERE SOMEBODY HAS RESTED A TORCH AGAINST THE WALL.
9133 PRINT"THERE ARE JAGGED ROCKS ABOVE YOU.
9134 GOTO 8400
9140 DATA 14,13,1,19,2,31,31
9142 PRINT"YOU'RE IN A CANYON.  HIGH ON THE WALL ABOVE YOU
9144 PRINT"IS SCRATCHED THE MESSAGE    'BILBO WAS HERE'
9146 GOTO 8400
9150 DATA 15,-2,101,-2,0,0,0
9152 PRINT"YOU'RE NOT A BIRD.  YOU CAN'T FLY!
9154 PRINT
9156 GOTO 8400
9160 DATA 16,5,33,2,10,1,106
9162 PRINT"YOU'RE IN A LOW CHAMBER.  A TIGHT TUNNEL GOES
9164 PRINT"EAST, AND YOU CAN WALK TO THE SOUTH OR WEST.
9166 PRINT"THERE IS LIGHT TO THE NORTH.
9168 GOTO 8400
9170 DATA 17,-2,101,-2,0,0,0
9172 PRINT"IT'S A TIGHT SQUEEZE.  YOU CAN'T GET PAST
9174 PRINT"WITH THE TREASURE.
9176 PRINT
9178 GOTO 8400
9180 DATA 18,-2,101,8,0,0,0
9182 PRINT"I DON'T THINK YOU CAN FIND THE CAVE.
9184 GOTO 8400
9190 DATA 19,224,2,2,14,1,42
9192 PRINT"YOU'RE AT THE TOP OF A CLIMB.
9194 PRINT"BELOW YOU A MESSAGE SAYS
9196 PRINT"     'BILBO WAS HERE'
9198 GOTO 8400
9200 DATA 20,226,1,2,2,25,2
9202 PRINT"YOU'RE AT THE NORTH SIDE OF A CHASM,
9204 PRINT"TOO WIDE TO JUMP.  RINGING ECHOES FROM
9206 PRINT"BELOW ARE THE ONLY INDICATION OF DEPTH.
9208 GOTO 8400
9210 DATA 21,1,226,2,2,38,25
9212 PRINT"YOU'RE IN XANADU.  BELOW YOU ALPH,  THE SACRED
9214 PRINT"RIVER RUNS THROUGH CAVERNS MEASURELESS TO MAN,
9216 PRINT"DOWN TO A SUNLESS SEA.
9218 GOTO 8400
9220 DATA 22,-2,33,13,50,29,30
9222 GOTO 8500
9230 DATA 23,2,1,2,31,2,2
9232 PRINT"YOU'RE ON THE LEDGE ABOVE THE GUILLOTINE ROOM.
9234 GOTO 8400
9240 DATA 24,-2,101,19,0,0,0
9242 PRINT"I HEAR THE GIANT THERE!!!
9244 PRINT"YOU'D BETTER GO BACK!
9246 PRINT
9248 GOTO 8400
9250 DATA 25,21,20,2,2,1,19
9252 PRINT"YOU'RE IN THE GIANT'S CAVERN.  BETTER
9254 PRINT"NOT BE HERE WHEN THE GIANT COMES!
9256 GOTO 8400
9260  DATA 26,-2,65,-2,50,11,14
9262 PRINT"YOU'RE IN THE QUEST RESEARCH AND DEVELOPMENT AREA.
9264 PRINT
9266 PRINT"I'M SORRY BUT VISITORS ARE NOT ALLOWED. YOU'LL HAVE
9268 PRINT"TO LEAVE.":PRINT:GOTO 8400
9270 DATA 27,2,40,2,2,21,20
9272 PRINT"YOU'RE IN THE CRYSTAL PALACE.  THE WALLS RESONATE
9274 PRINT"WTH AWESOME MUSIC.
9280 DATA 28,-2,60,221,50,14,19
9282 GOTO 8400
9290 DATA 29,2,42,2,13,1,1
9292 PRINT"YOU'RE AT THE TOP OF A GIANT STALACTITE.
9294 PRINT"YOU COULD SLIDE DOWN, BUT YOU COULDN'T
9296 PRINT"CLIMB BACK UP.
9298 GOTO 8400
9300 DATA 30,34,34,2,1,4,2
9302 PRINT"YOU'RE IN A LITTLE GROTTO.  THERE IS A
9304 PRINT"BOOK HERE CALLED JANE'S FIGHTING SHIPS,
9306 PRINT"DATED 1763.
9308 GOTO 8400
9310 DATA 31,14,14,23,2,1,2
9312 PRINT"YOU'RE IN THE GUILLOTINE ROOM.  A SHARP
9314 PRINT"ROCK BALANCES PRECARIOUSLY ON THE
9316 PRINT"LEDGE ABOVE YOU.
9318 GOTO 8400
9320 DATA 32,-2,101,516,0,0,0
9322 PRINT"YOU'RE IN A CHUTE, SCRAMBLING DOWN THE
9324 PRINT"ROCKS!  NO WAY TO STOP!!!    HANG ON!
9326 PRINT
9328 GOTO 8400
9330 DATA 33,2,1,2,1,116,3
9332 PRINT"THE TIGHT TUNNEL TURNS A CORNER.
9334 GOTO 8400
9340 DATA 34,1,35,2,1,30,30
9342 PRINT"YOU'RE IN A LITTLE TWISTY MAZE
9344 GOTO 8400
9350 DATA 35,2,1,2,37,34,36
9352 PRINT"YOU'RE IN A LITTLE TWISTING MAZE.
9354 GOTO 8400
9360 DATA 36,35,2,1,37,34,12
9362 PRINT"YOU'RE IN A TWISTING LITTLE MAZE.
9364 GOTO 8400
9370 DATA 37,2,1,35,2,13,2
9372 PRINT"YOU'RE IN A TWISTY LITTLE MAZE.
9374 GOTO 8400
9380 DATA 38,2,21,2,116,1,2
9381 PRINT"YOU'RE IN A PREHISTORIC DWELLING.  ON
9382 PRINT"THE WALL ARE DRAWINGS OF BISON DONE IN
9383 PRINT"RED CLAY.  THE FLOOR IS STREWN WITH
9384 PRINT"BONES, THE REMAINS OF ANCIENT RITUALS.
9385 PRINT"A SMALL TUNNEL GOES THROUGH THE FLOOR.
9387 GOTO 8400
9390 DATA 39,2,40,2,32,21,26
9392 PRINT"YOU'RE IN A BLACK HOLE.  THE
9394 PRINT"FORCE OF GRAVITY IS OVERWHELMING.
9396 GOTO 8400
9400 DATA 40,40,40,2,2,40,41
9402 PRINT"YOU'RE IN THE LABYRINTHE.
9404 GOTO 8400
9410 DATA 41,40,40,40,2,40,39
9412 PRINT"YOU'RE IN THE LABYRINTHE.
9414 PRINT"IT'S VERY DARK IN HERE.
9416 GOTO 8400
9420 DATA 42,28,28,28,28,28,28
9422 PRINT"YOU'RE IN THE ASHRAM.  INCENSE IS HEAVY
9424 PRINT"IN THE AIR, AND ALL DIRECTIONS
9426 PRINT"SEEM THE SAME.
9428 GOTO 8400
9430 print 9430: end
9440 print 9440: end
9450 print 9450: end
9460 print 9460: end
9470 print 9470: end
9480 print 9480: end
9490 print 9490: end
9999 END