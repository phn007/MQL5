//+------------------------------------------------------------------+
//|                                              ScriptFunctions.mqh |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"

bool CreateHorizontalLine(long chartId,string hLineName,int subWindow,double price  ){
   if(!ObjectCreate(chartId,hLineName,OBJ_HLINE,subWindow,0,price)){
      Print(__FUNCTION__, ": failed to create a horizontal line! Error code = ",GetLastError()); 
      return(false);
   }
   return true;
}

void SetProperties(  long              chartId,
                     string            hLineName,
                     color             clr,
                     ENUM_LINE_STYLE   style,
                     int               width,
                     bool              selection,
                     string            desc){
                     
   ObjectSetInteger(chartId,hLineName,OBJPROP_COLOR,clr);
   ObjectSetInteger(chartId,hLineName,OBJPROP_STYLE,style);
   ObjectSetInteger(chartId,hLineName,OBJPROP_WIDTH,width);
   ObjectSetInteger(chartId,hLineName,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chartId,hLineName,OBJPROP_SELECTED,selection);
   ObjectSetString(chartId,hLineName,OBJPROP_TEXT,desc);
}

void SetLineToCurrentPrice(long chartId,string hLineName,double price){
   ObjectSetDouble(chartId,hLineName,OBJPROP_PRICE,price);
}

void DeleteHorizontalLine(long chartId,string hLineName){
   ObjectDelete(chartId,hLineName);
}

bool FindExistingtHorizontalLine(long chartId,string hLineName){
   int result;
   result = ObjectFind(chartId,hLineName);
   
   if(result == 0) return true;
   else return false;
}
