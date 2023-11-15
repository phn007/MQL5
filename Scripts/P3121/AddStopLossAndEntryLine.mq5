//+------------------------------------------------------------------+
//|                                              AddStopLossLine.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// Stoploos Line
long              chartId1     = 0;
string            hLineName1   = "SL3121";
int               subWindow1   = 0;
double            price1       = iLow(NULL,PERIOD_CURRENT,1);

color             clr1         = clrLime;
bool              selection1   = true;
ENUM_LINE_STYLE   style1       = STYLE_SOLID;
int               width1       = 1;
string            desc1        = "SL";

//Entry Line
long              chartId2     = 0;
string            hLineName2   = "Entry3121";
int               subWindow2   = 0;
double            price2       = iHigh(NULL,PERIOD_CURRENT,1);

color             clr2         = clrBlue;
bool              selection2   = true;
ENUM_LINE_STYLE   style2       = STYLE_SOLID;
int               width2       = 1;
string            desc2        = "Entry";


#include "/Functions/ScriptFunctions.mqh"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   //SL Line 
   int findObjectResult1;
   findObjectResult1 = ObjectFind(chartId1,hLineName1);
   
   if(findObjectResult1 == 0){
      SetLineToCurrentPrice(chartId1,hLineName1,price1);
      SetProperties(chartId1,hLineName1,clr1,style1,width1,selection1,desc1);
   }else{
      CreateHorizontalLine(chartId1,hLineName1,subWindow1,price1);
      SetProperties(chartId1,hLineName1,clr1,style1,width1,selection1,desc1); 
   }
   
   //Entry Line
   int findObjectResult2 = ObjectFind(chartId2,hLineName2);
   
   if(findObjectResult2 == 0){
      SetLineToCurrentPrice(chartId2,hLineName2,price2);
      SetProperties(chartId2,hLineName2,clr2,style2,width2,selection2,desc2);
   }else{
      CreateHorizontalLine(chartId2,hLineName2,subWindow2,price2);
      SetProperties(chartId2,hLineName2,clr2,style2,width2,selection2,desc2);
   }
  }
//+------------------------------------------------------------------+
