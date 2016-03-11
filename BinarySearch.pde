private Item[] store = {
  new Item(184, 14), 
  new Item(196, 60), 
  new Item(206, 31), 
  new Item(2370, 65), 
  new Item(7282, 73), 
  new Item(8303, 90), 
  new Item(12328, 63), 
  new Item(12705, 14), 
  new Item(13066, 8), 
  new Item(14088, 92), 
  new Item(15320, 82), 
  new Item(15814, 60), 
  new Item(15917, 51), 
  new Item(17911, 96), 
  new Item(18061, 3), 
  new Item(18410, 56), 
  new Item(18465, 27), 
  new Item(18618, 64), 
  new Item(18871, 69), 
  new Item(19967, 45)
};                             
public int linearSearch(int catNumToFind)
{
  int ans=-1;
  for (int i = 0; i<=store.length-1; i ++) {
    if (store[i].getCatNum() == catNumToFind) {
      ans=store[i].getInventory();
    }//complete this method
  }
  return ans;
}
public int binarySearch(int catNumToFind)
{
  int ans=-1; 
  int low = 0;
  int high = store.length-1;

  int guess = (low+ high)/2;
  while (low != high) {  
    //System.out.println("high:"+high+"::guess:"+guess+"::low:"+low);
    if (catNumToFind <= store[guess].getCatNum() ) {
      high = guess-1;
      guess= (guess-1 + low) /2 ;
    } else if (catNumToFind >= store[guess].getCatNum() ) {
      low = guess +1;
      guess = (guess+1 + high) / 2 ;
    }
  }
  if (low==guess&&catNumToFind==store[guess].getCatNum()) {
    ans=store[guess].getInventory();
  }
  return ans;
}
public int binarySearch(int catNumToFind, int nLow, int nHigh)
{
  //int ans=-1;
  int guess=(nHigh+nLow)/2;
  if (nLow <= nHigh)
  {
    if (catNumToFind  < store[guess].getCatNum())
      return binarySearch(catNumToFind, nLow, guess - 1);
    else if (catNumToFind > store[guess].getCatNum())
      return binarySearch(catNumToFind, guess + 1, nHigh);
    else
      return store[guess].getInventory();
  }    
  return -1;
}
public void setup()
{
  int[] tests = {0, 183, 184, 2370, 15320, 19967, 19968};
  System.out.println();
  System.out.println("Testing Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (linearSearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+linearSearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Non Recursive Binary Search");
  System.out.println("===================================");
  for (int i = 0; i < tests.length; i++)
  {

    if (binarySearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+binarySearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Binary Search");
  System.out.println("===============================");
  for (int i = 0; i < tests.length; i++)
  {

    if (binarySearch(tests[i], 0, store.length - 1) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+binarySearch(tests[i], 0, store.length - 1) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
}

public void draw()
{
  //empty!
}