//+------------------------------------------------------------------+
//|                                                   EntryOrder.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include "/Functions/ScriptFunctions.mqh"

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
long chartID = 0;
string entryLineName = "Entry3121";
string slLineName    = "SL3121";

double askPrice;
double bidPrice;
double entryPrice;
double slPrice;

ENUM_ORDER_TYPE orderType;

// buy -> ask
// sell -> bid

void OnStart()
  {
//---
   //Check if SL3121 line existing
   if(!FindExistingtHorizontalLine(chartID,slLineName)){
      Print("SL3121 line not found. Exiting.");
      return;
   }
   askPrice = SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   bidPrice = SymbolInfoDouble(Symbol(),SYMBOL_BID);
   slPrice  = ObjectGetDouble(chartID,slLineName,OBJPROP_PRICE);
   
   //Check if Entry3121 line doesn't exists
   if(!FindExistingtHorizontalLine(chartID,entryLineName)){
      orderType = GetInstantOrderType(); 
   }else{
      entryPrice = ObjectGetDouble(chartID,entryLineName,OBJPROP_PRICE);
   }
   
   //Entry Price Existing
   if(entryPrice != 0){
      orderType = GetPendingOrderType();
   }
   
   Print("Position Type : ", EnumToString(orderType));
   //OrderSend()
  }
//+------------------------------------------------------------------+

ENUM_ORDER_TYPE GetInstantOrderType(){
   if(askPrice > slPrice)        return ORDER_TYPE_BUY;
   else if(bidPrice < slPrice)   return ORDER_TYPE_SELL;
   return false;
}

ENUM_ORDER_TYPE GetPendingOrderType(){
   if(slPrice < entryPrice && entryPrice < askPrice){
      return ORDER_TYPE_BUY_LIMIT;
   }
   
   if(slPrice < entryPrice && entryPrice > askPrice){
      return ORDER_TYPE_BUY_STOP;
   }
   
   if(slPrice > entryPrice && entryPrice > bidPrice){
      return ORDER_TYPE_SELL_LIMIT;
   }
   
   if(slPrice > entryPrice && entryPrice < bidPrice){
      return ORDER_TYPE_SELL_STOP; 
   }
   return false;
}