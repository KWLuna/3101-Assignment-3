mtype = {PdN, Cola, PdL, Grog, Cafe, Leche, ColaCao}
mtype:coins = {five, ten, fifty, hundred}
mtype:op = {insert_coin, cancel, select_drink, take_drink, dispense_drink, return_money}

byte items_price[7] = {100,100,100,100,150,120,140} // Price
byte items_stock[7] = {100,100,100,100,150,120,140} // Current Stock
byte coins[4] = {0,0,0,0} // No. of coins in each type
byte v; // Variable to store the value of the coin or drink
byte selected_item; // Variable to store the selected drink

chan user_controller_ch = [10] of {mtype:op, byte} // Asynchronous channel
chan gate_user_ch = [0] of {mtype:op}           // Rendezvous channel
chan gate_controller_ch = [0] of {mtype:op}     // Rendezvous channel

active proctype gate(){
  do
  // Receive the inserted coin, value
  :: user_controller_ch?insert_coin, v ->
    if
      // If the inserted coin is less than the price of the selected drink, do nothing
      :: (v < items_price[selected_item]) -> skip
      // Else, dispense the drink and send the signal to dispense the drink
      :: else -> gate_user_ch!dispense_drink
    fi
  // Receive the cancel signal and send the signal to return the money
  :: user_controller_ch?cancel -> gate_user_ch!return_money   
  // Receive the selected drink, value and store the selected drink
  :: user_controller_ch?select_drink, v -> selected_item = v
  od
}

active proctype machine_controller( ){
  do
    // Receive the signal to dispense the drink 
    :: gate_user_ch?dispense_drink ->
      if
        // If the selected item is in stock (>0), reduce the stock by 1
        :: (items_stock[selected_item] > 0) -> items_stock[selected_item]--
        // Else, send signal to return money
        :: else -> gate_controller_ch!return_money
      fi
    // Receive the signal to return money and send signal to return money
    :: gate_user_ch?return_money -> gate_controller_ch!return_money 
  od 
}

active proctype user(){
    do
    // Infinite Loop, await for user input
    :: true ->                          
      // Send signal to insert coin, value                               
      user_controller_ch!insert_coin, v;
      // Send signal to select drink, value
      user_controller_ch!select_drink, v;
      if
        :: (v >= items_price[selected_item]) -> user_controller_ch!take_drink
        :: else -> user_controller_ch!cancel
      fi
    od
}

/* init{
  run gate();
  run machine_controller();
  run user();
} */