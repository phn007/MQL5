//+------------------------------------------------------------------+
//|                                              AddStopLossLine.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

long              chartId1     = 0;
string            hLineName1   = "SL3121";
int               subWindow1   = 0;
double            price1       = iLow(NULL,PERIOD_CURRENT,1);

color             clr1         = clrLime;
bool              selection1   = true;
ENUM_LINE_STYLE   style1       = STYLE_SOLID;
int               width1       = 1;
string            desc1        = "SL";

//For Find EntryLine
long              chartId2     = 0;
string            hLineName2   = "Entry3121";

#include "/Functions/ScriptFunctions.mqh"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   //Entry Line
   if(FindExistingtHorizontalLine(chartId2,hLineName2)){
      DeleteHorizontalLine(chartId2,hLineName2);
   }
   
   //SL Line
   if(FindExistingtHorizontalLine(chartId1,hLineName1)){
      SetLineToCurrentPrice(chartId1,hLineName1,price1);
      SetProperties(chartId1,hLineName1,clr1,style1,width1,selection1,desc1);
   }else{
      CreateHorizontalLine(chartId1,hLineName1,subWindow1,price1);
      SetProperties(chartId1,hLineName1,clr1,style1,width1,selection1,desc1);
   }
  }
//+------------------------------------------------------------------+
