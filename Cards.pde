public class Card
{   
  private char suit;
  private int rank;
  private int cardImageStatus;
  private String cardImage;
  private String backSide = "backSide.png";
  private String currentCardImage;
  
  //private int cardWidth = 100;
  //private int cardHeight = 150;  
  private int cardWidth = 1280 / 16;
  private int cardHeight = 720 / 6;
  
  public Card(char s, int r, String cI)
  {
    suit = s;
    rank = r;
    cardImage = cI;
    currentCardImage = cI;
  }
  
  public char getSuit()
  {
    return suit;
  }
  
  public int getRank()
  {
    return rank;
  }
  
  public String getCardImage()
  {
    return cardImage;
  }
  
  public void setCardImage(String s)
  {
    cardImage = s;
  } 
  
  public String getBackSide()
  {
    return backSide; 
  }
  
  public String getCurrentCardImage()
  {
    return currentCardImage;
  }
  
  public void setCurrentCardImage(int i)
  {
    currentCardImage = i == 0 ? backSide : cardImage;
    cardImageStatus = i;
  }
  
  public int getCardImageStatus()
  {
    return cardImageStatus;
  }
  
  public void drawCard(String cardName, int x, int y)
  {
    image(loadImage(cardName), x, y, cardWidth, cardHeight);
  }
    
}
