mtype = {PdN, Cola, PdL, Grog, Cafe, Leche, ColaCao}


mtype:coins = {five, ten, fifty, hundred}

mtype:op = {insert_coin, cancel, select_drink, take_drink}


byte items_price[7] = {100,100,100,100,150,120,120}

byte items_stock[7] = {100,100,100,100,150,120,120}

byte coins[4] = {0,0,0,0}

chan user_controller_ch = [10] of {mtype:op, byte}
chan gate_user_ch = [0] of {mtype:op}
chan gate_controller_ch = [0] of {mtype:op}



active proctype gate(){
  do:: break
  od
}

active proctype machine_controller( ){
   do:: true -> break
   od 
}

active proctype user(){
    do:: true -> break
   od
}



/* init{
  run gate();
  run machine_controller();
  run user();
  
} */
